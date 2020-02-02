class SearchesController < ApplicationController
  def search
  	@input = params[:input]
  	@sort = params[:sort]
  	@results = searching(@input, @sort)
  end

  private

  def searching(input, sort)
    if input == ""
      if sort == "User"
        User.all
      elsif sort == "Brand"
        Cloth.all
      elsif sort == "Category"
        Category.all
      end
    else
      if sort == "User"
        User.where('name LIKE ?', '%'+input+'%')
      elsif sort == "Brand"
        Cloth.where('brand LIKE ?', '%'+input+'%')
      elsif sort == "Category"
        Category.where('category LIKE ?', '%'+input+'%')
      end
    end
  end

end
