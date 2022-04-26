class Admins::OrderDetailsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if params[:order_detail][:production_status]=="製作中"
       @order_detail.order.update(order_status: 2)
    end
    if params[:order_detail][:production_status]=="製作完了"
      @order_detail.order.update(order_status: 3)
    end
     redirect_to request.referer, notice: "製作ステータスを更新しました"
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
