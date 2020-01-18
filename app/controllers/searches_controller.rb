class SearchesController < ApplicationController
  def search
  	@users = User.all
  	@clothes = Cloth.all
  	@categories = Category.all
  	@input = params[:input]
  	@sort = params[:sort]
  	@results = searching(@input, @sort)
  end

  private
  def searching(input, sort)
  	if sort == "User"
  		User.where('name LIKE ?', '%'+input+'%')
  	elsif sort == "Brand"
  		Cloth.where('brand LIKE ?', '%'+input+'%')
  	elsif sort == "Category"
  		Category.where('category LIKE ?', '%'+input+'%')
  	end
  end
end
