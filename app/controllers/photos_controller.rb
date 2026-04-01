class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gallery

  def new
    @photo = @gallery.photos.build
  end

  def create
    @photo = @gallery.photos.build(photo_params)
    if @photo.save
      redirect_to @gallery, notice: "Photo uploaded successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end