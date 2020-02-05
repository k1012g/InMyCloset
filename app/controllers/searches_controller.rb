class SearchesController < ApplicationController
  def search
    # 入力内容
  	@input = params[:input]
    # ソート
  	@sort = params[:sort]
    # 検索結果
  	@results = searching(@input, @sort)
  end

  private

  # 検索条件で絞り込む
  def searching(input, sort)
    # 入力なしの場合
    if input == ""
      if sort == "User"
        User.all
      elsif sort == "Brand"
        Cloth.all
      elsif sort == "Category"
        Category.all
      end
    # 入力していた場合
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
