class Response < ApplicationRecord

  belongs_to :member
  belongs_to :advice

  validates :body, presence: true

end
