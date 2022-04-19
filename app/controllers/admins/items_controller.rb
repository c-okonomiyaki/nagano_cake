class Admins::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page])
    #@genre=Genre.find(params[:genre_id])
  end

  def show
  end

  def edit
  end

  def new
    @item=Item.new
  end
end
