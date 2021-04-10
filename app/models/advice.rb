class Advice < ApplicationRecord

  belongs_to :member
  belongs_to :problem

  has_many :responses, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
