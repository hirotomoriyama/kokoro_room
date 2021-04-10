class Category < ApplicationRecord

  has_many :problems, dependent: :destroy

end
