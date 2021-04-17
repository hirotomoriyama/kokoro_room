class Advice < ApplicationRecord

  belongs_to :member
  belongs_to :problem

  has_many :responses, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # favoritesテーブルに「member_id」が存在するかを検索
  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end

end
