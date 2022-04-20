class Customers::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:item_image,:item_name,:price,:introduction,:is_active,:genre_id)
  end
end
