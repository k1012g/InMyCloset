class TopController < ApplicationController
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

  def confirm
    if signed_in?
      redirect_to user_path(current_user.id)
    end
  end
end
