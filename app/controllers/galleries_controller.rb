class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @galleries = Gallery.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @gallery = current_user.galleries.build
  end

  def create
    @gallery = current_user.galleries.build(gallery_params)
    if @gallery.save
      redirect_to @gallery, notice: "Gallery created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @gallery.update(gallery_params)
      redirect_to @gallery, notice: "Gallery updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gallery.destroy
    redirect_to galleries_path, notice: "Gallery deleted."
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def authorize_user!
    redirect_to galleries_path, alert: "Not authorised." unless @gallery.user == current_user
  end

  def gallery_params
    params.require(:gallery).permit(:title, :description)
  end
end