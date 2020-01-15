class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

# association
    has_many :clothes
    has_many :favorites
# 自分がフォローしている人との関連
    has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
    has_many :followings, through: :active_relationships, source: :follower
# 自分をフォローしている人との関連
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
    has_many :followers, through: :passive_relationships, source: :following

# followされているかどうかを確認するメソッド
    def followed_by?(user)
    	passive_relationships.find_by(following_id: user.id).present?
    end
end
