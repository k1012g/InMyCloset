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
  	end
  end

  def about
  end
end
