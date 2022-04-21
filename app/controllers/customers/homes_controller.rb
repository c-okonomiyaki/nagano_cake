class Customers::HomesController < ApplicationController
  def top
    @items = Item.page(params[:page]).per(4).order(created_at: :desc) #adminがupした商品を新しい順に4つ表示
  end

  def about
  end
end
