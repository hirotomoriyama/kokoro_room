class Response < ApplicationRecord
  belongs_to :member
  belongs_to :advice

  validates :body, presence: true
  # 星の評価を5段階評価で保存
  validates :rate, presence: true
  # 星の評価を0.5〜5点に設定
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5,
  }
end
