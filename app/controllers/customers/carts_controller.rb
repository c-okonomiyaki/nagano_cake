class Customers::CartsController < ApplicationController
  before_action :authenticate_customer!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def index
    @cart_items = Cart.where(customer_id: current_customer)
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    # customer = current_customer
    # cart = customer.carts

  end

  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
    # @cart.item_id = @item.id
    if @cart.save
      redirect_to carts_path
    else
      redirect_to request.referer
    end
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to request.referer
  end

  def all_destory
    @carts = Cart.where(customer_id: current_customer)
    @carts.destroy_all
    redirect_to request.referer
  end

  private
  def cart_params
      params.require(:cart).permit(:item_id, :quantity)
  end

end
