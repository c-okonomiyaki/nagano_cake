class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def index
  end

  def show
  end

  def edit
<<<<<<< HEAD
    @item=Item.find(params[:id])
    @genres=Genre.all
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item.id) ,notice: "商品情報を更新しました"
    else
      @genres = Genre.all
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
      redirect_to admins_items_path ,notice: "商品を登録しました"
    else
      @genres=Genre.all
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image,:item_name,:price,:introduction,:is_active,:genre_id)
=======
  end

  def new
>>>>>>> main
  end
end
