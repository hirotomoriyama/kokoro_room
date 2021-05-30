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
    self.set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end

  # refileの使用
  attachment :image

  # メールアドレスのバリデーションにメールアドレスの形式ではない場合は除外し、一意性を付与
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX } }
  validates :email, uniqueness: { case_sensitive: false }
  validates :encrypted_password, presence: true
  validates :name, presence: true

  # 退会済みのユーザーが同じアカウントでログイン出来ないよう設定
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
