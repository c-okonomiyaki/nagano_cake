class Admins::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
