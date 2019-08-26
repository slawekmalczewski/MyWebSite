class PhotoGalleriesController < ApplicationController

  layout "admin"

  before_action :check_login, :except => [:login, :loginProcess, :logout]

  def index
    @gallery = PhotoGallery.all
  end

  def new
    @gallery = PhotoGallery.new()
    @counter = PhotoGallery.count + 1
  end

  def create
    @gallery = PhotoGallery.new(required_parameters)
      if @gallery.save
        flash[:alert] = "Photo Gallery sucessfully created"
        redirect_to(:action => 'index')
      else
        @counter = PhotoGallery.count + 1
        render('new')
      end
  end

  def edit
    @gallery = PhotoGallery.find(params[:id])
    @counter = PhotoGallery.count
  end

  def update
    @gallery = PhotoGallery.find(params[:id])
    if @gallery.update_attributes(required_parameters)
      flash[:alert] = "Photo Gallery sucessfully updated"
      redirect_to(:action => 'show', :id => @gallery.id)
    else
      @counter = PhotoGallery.count
      render('edit')
    end
  end

  def show
    @gallery = PhotoGallery.find(params[:id])
  end

  def delete
    @gallery = PhotoGallery.find(params[:id])
  end

  def confirm_deletion
    gallery = PhotoGallery.find(params[:id]).destroy
    flash[:alert] = "Photo Gallery sucessfully deleted"
    redirect_to(:action => 'index')
  end


private

  def required_parameters
    params.require(:photo_gallery).permit(:gallerytitle, :galleryDescription, :galleryPosition, :galleryVisibility, :galleryAuthor, :country, :galleryImageHeader, uploads: [])
  end

end
