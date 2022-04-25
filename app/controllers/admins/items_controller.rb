class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items=Item.page(params[:page])
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
    @genres=Genre.all
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item.id)
    else
      render "edit"
    end
  end

  def new
    @item=Item.new
    @genres=Genre.all
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to admins_items_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image,:item_name,:price,:introduction,:is_active,:genre_id)
  end
end
