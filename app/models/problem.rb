class Problem < ApplicationRecord

  # 外部キーのnilを許可
  belongs_to :member, optional: true
  belongs_to :category

  has_many :advices, dependent: :destroy

end
