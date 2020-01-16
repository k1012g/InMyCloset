class FavoritesController < ApplicationController
  def create
  	Favorite.create(user_id: current_user.id, cloth_id: params[:cloth_id])
  	redirect_back(fallback_location: clothes_path)
  end

  def destroy
  	Favorite.find_by(user_id: current_user.id, cloth_id: params[:cloth_id]).destroy
  	redirect_back(fallback_location: clothes_path)
  end
end
