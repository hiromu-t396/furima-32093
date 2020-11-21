class ItemsController < ApplicationController
  def index

  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @category = Category.new
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

end
