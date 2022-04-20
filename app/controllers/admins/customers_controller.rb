class Admins::CustomersController < ApplicationController
  def index
    @customers=Customer.page(params[:page])
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customers_path
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name,:first_name_kana,:last_name,:last_name_kana,
    :postcode,:address,:call_number,:email,:is_deleted)
  end

end
