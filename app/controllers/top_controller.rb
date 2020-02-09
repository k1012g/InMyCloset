class TopController < ApplicationController
  before_action :authenticate_user!, only: [:others]
  before_action :current_user?, only: [:others]
  def top
    # ログインしているかどうかのif文
  	if signed_in?

      # フォローしている人を取得
  		@followings = current_user.followings

      # 配列を作成
  		@followings_clothes = []
  		@followings.each do |user|
  			@followings_clothes += user.cloths
  		end

      # 新着順に並び替え
  		@timeline_clothes = @followings_clothes.sort{|a, b|
	      b.id <=> a.id
	    }

      # 今日のフォローしている人の投稿をカウント
      @todayPost = 0
      @followings_clothes.each do |post|
        if (post.created_at.to_s.match(/#{Date.today.to_s}.+/))
          @todayPost += 1
        end
      end
  	end
  end

  def about
  end

  # ログインしていないと使えない機能を使おうとするとこのページに遷移
  def confirm
    if signed_in?
      redirect_to user_path(current_user.id)
    end
  end

  # ユーザーのその他の設定画面
  def others
    @user = User.find(params[:id])
  end

  private
  def current_user?
    user = User.find(params[:id])
    if current_user != user
      redirect_to others_path(current_user.id)
    end
  end
end
