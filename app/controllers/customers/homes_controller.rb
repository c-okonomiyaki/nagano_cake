class Customers::HomesController < ApplicationController
  def top
    @items = Item.page(params[:page])
    @item = Item.find(params[:id])
    @random = Item.order("RANDOM()").limit(5)
  end

  def about
  end
end
