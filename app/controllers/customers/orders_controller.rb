class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order=Order.new
  end

  def create
    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    @order.save
    @cart_items=current_customer.carts.all
      @cart_items.each do |cart_item|
        @order_details=@order.order_details.new
        @order_details.item_id=cart_item.item_id
        @order_details.quantity=cart_item.quantity
        @order_details.tax_price=cart_item.item.price*1.10
        @order_details.save
      end
    carts = Cart.where(customer_id: current_customer)
    carts.destroy_all
    redirect_to orders_thanx_path
  end

  def confirm
    @order=Order.new(order_params)
    @order.postage=800
    if params[:order][:select_address]=="0"
      @order.name=current_customer.last_name+current_customer.first_name
      @order.address=current_customer.address
      @order.postcode=current_customer.postcode
    elsif params[:order][:select_address]=="1"
      if params[:order][:delivery_id]==""
        redirect_to request.referer
      else
        @order.name=Delivery.find(params[:order][:delivery_id]).address_name
        @order.address=Delivery.find(params[:order][:delivery_id]).address
        @order.postcode=Delivery.find(params[:order][:delivery_id]).postcode
      end
    elsif params[:order][:select_address]=="2"
      @delivery=Delivery.new
      @delivery.address_name=params[:order][:name]
      @delivery.address=params[:order][:address]
      @delivery.postcode=params[:order][:postcode]
      @delivery.customer_id=current_customer.id
      if @delivery.save
        @order.name=@delivery.address_name
        @order.address=@delivery.address
        @order.postcode=@delivery.postcode
      else
        render "new"
      end
    end
      @cart_items=Cart.where(customer_id:current_customer.id)
      @total=@cart_items.inject(0){ |sum, item| sum + item.subtotal }
  end

  def thanx
  end

  def index
    @orders=current_customer.orders
  end

  def show
    @order=Order.find(params[:id])
    @order.postage=800
    @order_details=@order.order_details
    @subtotal=@order_details.map{|order_detail|order_detail.tax_price*order_detail.quantity}
    @total=@subtotal.sum
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:postcode,:address,:name,:claim,:postage)
  end

end
