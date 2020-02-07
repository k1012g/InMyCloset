class ClothesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :current_user?, only: [:new, :create, :edit, :update, :destroy]
  def new
    @cloth = Cloth.new
  end

  def create
    @cloth = Cloth.new(cloth_params)
    @cloth.user_id = current_user.id
    if @cloth.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @cloth = Cloth.find(params[:id])
  end

  def update
    @cloth = Cloth.find(params[:id])
    if @cloth.update(cloth_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    Cloth.find(params[:id]).destroy
    redirect_to user_path(current_user.id)
  end

  private
  def cloth_params
    params.require(:cloth).permit(:user_id, :category_id, :brand, :size, :image)
  end

  def current_user?
    # 自分かどうかの判定
    cloth = Cloth.find(params[:id])
    if cloth.user != current_user
      redirect_to user_path(current_user.id)
    end
  end
end
