class Customers::CartsController < ApplicationController
  def index
    customer = current_customer
    @cart_items = customer.cart.item
  end
  
  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
    # @cart.item_id = @item.id
    if @cart.save
      redirect_to item_path(@item)
    else
      @books = Book.all
      render :index
    end
  end

  private
  def cart_params
      params.require(:cart).permit(:item_id, :quantity)
  end

end
