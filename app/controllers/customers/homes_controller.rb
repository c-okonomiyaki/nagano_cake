class Customers::HomesController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def top
    @items = Item.page(params[:page]).per(4).order(created_at: :desc) #adminがupした商品を新しい順に4つ表示
  end

  def about
  end
end
