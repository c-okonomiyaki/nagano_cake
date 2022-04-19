class Customers::HomesController < ApplicationController
  def top
    @item = Item.new
    @random = Item.order("RANDOM()").limit(5)
  end

  def about
  end
end
