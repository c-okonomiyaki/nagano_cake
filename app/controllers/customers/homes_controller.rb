class Customers::HomesController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def top
  end

  def about
  end
end
