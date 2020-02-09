class RelationshipsController < ApplicationController
	before_action :authenticate_user!

	# フォロー
	def create
		Relationship.create(following_id: current_user.id, follower_id: params[:user_id])
		@user = User.find(params[:user_id])
	end

	# フォロー取り消し
	def destroy
		Relationship.find_by(following_id: current_user.id, follower_id: params[:user_id]).destroy
		@user = User.find(params[:user_id])
	end
end
