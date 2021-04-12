class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :problems, dependent: :destroy
  has_many :advices, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # 退会済みのユーザーが同じアカウントでログイン出来ないよう設定
  def active_for_authentication?
    super && (is_deleted == false)
  end

end
