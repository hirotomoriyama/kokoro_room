class Problem < ApplicationRecord

  belongs_to :member
  belongs_to :category

  has_many :advices, dependent: :destroy

end
