class Customers::CartsController < ApplicationController
  def index
    customer = current_customer
    @cart_item = customer.cart.item
  end
  
  private
  def cart_params
      params.require(:cart).permit(:item_id, :quantity)
  end
  
end
