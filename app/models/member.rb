class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  has_many :problems, dependent: :destroy
  has_many :advices, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :social_profiles, dependent: :destroy
  # LINEログインのモデルを設計
  def social_profile(provider)
    social_profiles.select{ |sp| sp.provider == provider.to_s }.first
  end

  # LINEログイン時、コントローラーで呼び出す値の定義
  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']
    credentials = omniauth['credentials']
    info = omniauth['info']

    _access_token = credentials['refresh_token']
    _access_secret = credentials['secret']
    credentials = credentials.to_json
    _name = info['name']
  end

  # refileの使用
  attachment :image

  # メールアドレスの形式ではない場合は除外
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX } }
  # メールアドレスに一意性を付与、大文字と小文字の判別を無くす
  validates :email, uniqueness: { case_sensitive: false }
  validates :encrypted_password, presence: true
  # ニックネームに一意性を付与
  validates :name, presence: true, uniqueness: true

  # 退会済みのユーザーが同じアカウントでログイン出来ないよう設定
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
