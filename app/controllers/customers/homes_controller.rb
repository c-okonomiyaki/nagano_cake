class Customers::HomesController < ApplicationController
  def top
    @items = Item.page(params[:page])
    @item = Item.new
  end

  def about
  end
end
