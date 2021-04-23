class Category < ApplicationRecord

  has_many :problems, dependent: :destroy

  validates :name, presence: true

end
