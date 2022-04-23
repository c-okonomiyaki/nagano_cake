class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
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
    if @order.update(order_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
