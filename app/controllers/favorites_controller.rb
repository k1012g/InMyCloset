class FavoritesController < ApplicationController
  before_action :current_user?, only: [:show]
  before_action :authenticate_user!
  def show
  	@favorites = current_user.favorites
  end

  def create
  	Favorite.create(user_id: current_user.id, cloth_id: params[:cloth_id])
    @clothes = Cloth.find(params[:cloth_id])
  end

  def destroy
  	Favorite.find_by(user_id: current_user.id, cloth_id: params[:cloth_id]).destroy
    @clothes = Cloth.find(params[:cloth_id])
  end

  private
  # 自分かどうかの判定
  def current_user?
    user = User.find(params[:user_id])
    if user != current_user
      redirect_to user_path(current_user.id)
    end
  end
end
