class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :problems, dependent: :destroy
  has_many :advices, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :favorites, dependent: :destroy

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
