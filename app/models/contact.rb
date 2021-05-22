class Contact < ApplicationRecord

  validates :name, presence: true
  validates :body, presence: true
  # メールアドレスのバリデーションにメールアドレスの形式ではない場合は除外するよう設定
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX } }
end
