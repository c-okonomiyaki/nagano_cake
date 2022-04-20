class Customers::CartsController < ApplicationController
  def index
  end
  
  private
  def cart_params
      params.require(:cart).permit(:item_id, :quantity)
  end
  
end
