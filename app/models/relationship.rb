class Relationship < ApplicationRecord
# 多対多(自己結合)の記述
	belongs_to :following, class_name: "User"
	belongs_to :follower, class_name: "User"
end
