class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :problems, dependent: :destroy
  has_many :advices, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
