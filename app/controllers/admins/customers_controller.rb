class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def index
  end

  def show
  end

  def edit
  end
<<<<<<< HEAD

  def update
    @customer=Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customers_path, notice: "ユーザー情報を更新しました"
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name,:first_name_kana,:last_name,:last_name_kana,
    :postcode,:address,:call_number,:email,:is_deleted)
  end

=======
>>>>>>> main
end
