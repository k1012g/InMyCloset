class Cloth < ApplicationRecord
# refileの記述
	attachment :image

# アソシエーション
	belongs_to :user
	belongs_to :category
	has_many :favorites

# バリデーション
	validates :category_id, presence: true
	validates :brand, presence: true
	validates :size, presence: true, length: { in: 1..10 }
	validates :image, presence: true

# いいねされているかどうかのメソッド
	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
