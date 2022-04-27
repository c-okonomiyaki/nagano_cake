class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery

  def index
    @genres=Genre.all
    @genre=Genre.new
  end

  def create
    @genre=Genre.new(genre_params)
    if @genre.save
      redirect_to request.referer ,notice: "ジャンルを作成しました"
    else
      redirect_to request.referer
    end
  end

  def edit
    @genre=Genre.find(params[:id])
  end

  def update
    @genre=Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admins_genres_path ,notice: "ジャンル名を更新しました"
    else
      render "edit"
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end

end
