class TopController < ApplicationController
  def top
  	if signed_in?
  		@users = current_user.followings
  		@clothes = []
  		@users.each do |user|
  			@clothes += user.cloths
  		end
  		@cloth = @clothes.sort{|a, b|
	      b.id <=> a.id
	    }
      @todayPost = 0
      @clothes.each do |post|
        if (post.created_at.to_s.match(/#{Date.today.to_s}.+/))
          @todayPost += 1
        end
      end
  	end
  end

  def about
  end
end
