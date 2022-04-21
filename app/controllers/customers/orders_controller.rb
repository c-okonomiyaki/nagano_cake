class Customers::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def confirm
    @order=Order.new(order_params)
    if params[:order][:select_address]=="0"
      @order.name=current_customer.name
      @order.address=current_customer.address
      @order.postcode=current_customer.postcode
    elsif params[:order][:select_address]=="1"
      @order.name=Delivery.find(params[:order][:delivery]).address_name
      @order.address=Delivery.find(params[:order][:delivery]).address
      @order.postcode=Delivery.find(params[:order][:delivery]).postcode
    elsif params[:order][:select_address]=="2"
      @delivery=Delivery.new
      @delivery.address_name=params[:order][:name]
      @delivery.address=params[:order][:address]
      @delivery.postcode=params[:order][:postcode]
      @delivery

      @cart_items=Cart.where(customer_id:current_customer.id)
      @total=0
  end

  def thanx
  end

  def index
    @orders=current_customer.orders
  end

  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:postcode,:address,:name,:claim,:postage)
  end

end
