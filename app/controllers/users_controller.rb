class UsersController < ApplicationController
  before_action :current_user?, only: [:edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @categories = Category.all
    @user = User.find(params[:id])
    @user_cloth =@user.cloths.pluck(:brand)
    @times = 1
    @other_times = 1
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if params[:delete] == "yes"
      @user.profile_image = nil
    end
  	if @user.update(user_params)
  		redirect_to user_path(@user.id)
  	else
  		render :edit
  	end
  end

  def follow
    @user = User.find(params[:id])
    @follower = @user.followers
    @following = @user.followings
  end

  def index
    redirect_to new_user_registration_path
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
