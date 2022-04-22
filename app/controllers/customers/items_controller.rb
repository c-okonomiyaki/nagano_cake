class Customers::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
    # @cart.item_id = @item.id
    if @cart.save
      redirect_to item_path(@item)
    else

      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_image,:item_name,:price,:introduction,:is_active,:genre_id)
  end

  def cart_params
      params.require(:cart).permit(:item_id, :quantity)
  end
end
