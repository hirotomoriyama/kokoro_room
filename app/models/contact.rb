class Contact < ApplicationRecord
  belongs_to :member

  validates :name, presence: true
  validates :body, presence: true
end
