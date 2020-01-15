class UsersController < ApplicationController
  before_action :current_user?, only: [:edit, :update]
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@user_clothes = @user.cloths
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user.id)
  	else
  		render :edit
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def current_user?
  	user = User.find(params[:id])
  	if user != current_user
  		redirect_to user_path(current_user.id)
  	end
  end
end
