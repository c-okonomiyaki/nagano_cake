class Customers::DeliveriesController < ApplicationController
  before_action :authenticate_customer!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def index
    @delivery=Delivery.new
    @deliveries=current_customer.deliveries
  end

  def create
    @delivery=Delivery.new(delivery_params)
    @delivery.customer_id=current_customer.id
    if @delivery.save
      redirect_to request.referer ,notice: "配送先を登録しました"
    else
      @deliveries=current_customer.deliveries
      render "index"
    end
  end

  def destroy
    @delivery=Delivery.find(params[:id])
    @delivery.destroy
    redirect_to request.referer ,notice: "配送先を削除しました"
  end


  def edit
    @delivery=Delivery.find(params[:id])
  end

  def update
    @delivery=Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path ,notice: "配送先を更新しました"
    else
      render "edit"
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(:address,:postcode,:address_name)
  end

end
