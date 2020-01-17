class RelationshipsController < ApplicationController
	def create
		Relationship.create(following_id: current_user.id, follower_id: params[:user_id])
		redirect_back(fallback_location: users_path)
	end

	def destroy
		Relationship.find_by(following_id: current_user.id, follower_id: params[:user_id]).destroy
		redirect_back(fallback_location: users_path)
	end
end
