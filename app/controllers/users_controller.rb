class UsersController < ApplicationController
  before_action :current_user?, only: [:edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @categories = Category.all
    @user = User.find(params[:id])

    # ユーザーの投稿をブランド名のみ取得
    @user_cloth_brand =@user.cloths.pluck(:brand)

    # each文の回数をカウントする用
    @times = 1
    @other_times = 1
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
     # 画像削除する場合のif文
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

    # フォローしている人を取得
    @follower = @user.followers

    # フォロワーを取得
    @following = @user.followings
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  # 自分かどうかを判定するメソッド
  def current_user?
  	user = User.find(params[:id])
  	if user != current_user
  		redirect_to user_path(current_user.id)
  	end
  end
end
