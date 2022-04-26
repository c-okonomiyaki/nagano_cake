class Admins::OrdersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.postage = 800
    @subtotal = @order_details.map{|order_detail|order_detail.tax_price*order_detail.quantity}
    @total = @subtotal.sum
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.order_status=1
       @order_details.update(production_status:1)
     redirect_to request.referer, notice: "注文ステータスを更新しました"
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
