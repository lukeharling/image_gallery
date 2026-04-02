class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gallery
  before_action :set_photo, only: [:destroy]

  def new
    @photo = @gallery.photos.new
  end

  def create
    @photo = @gallery.photos.new(photo_params)
    if @photo.save
      redirect_to @gallery, notice: "Photo uploaded successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @photo.destroy
    redirect_to @gallery, notice: "Photo deleted."
  end

  private

  def set_gallery
    @gallery = current_user.galleries.find(params[:gallery_id])
  end

  def set_photo
    @photo = @gallery.photos.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end