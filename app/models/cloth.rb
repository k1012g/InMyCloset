class Cloth < ApplicationRecord
	attachment :image

# association
	belongs_to :user
	belongs_to :category
	has_many :favorites

# バリデーション
	validates :brand, presence: true, length: { in: 1..20 }
	validates :size, presence: true
	validates :category_id, presence: true
end
