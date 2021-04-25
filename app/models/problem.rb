class Problem < ApplicationRecord
  belongs_to :member
  belongs_to :category

  has_many :advices, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true
end
