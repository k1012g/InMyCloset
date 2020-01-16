class Cloth < ApplicationRecord
	attachment :image

# association
	belongs_to :user
	belongs_to :category
	has_many :favorites

# バリデーション
	validates :brand, presence: true, length: { in: 1..20 }
	validates :size, presence: true, length: { in: 1..10 }
	validates :category_id, presence: true

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
