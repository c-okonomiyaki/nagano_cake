class Customers::OrdersController < ApplicationController
  def new
    @order=Order.new
    # @customer=Customer.find(current_customer.id)
  end

  def index
  end

  def confirm
  end

  def thanx
  end

  def show
  end
end
