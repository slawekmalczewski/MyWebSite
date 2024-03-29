class PhotoGalleriesController < ApplicationController

  layout "application"
  layout "admin", :only => "admin_gallery_index"

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all

  def index
    @gallery = PhotoGallery.where(:galleryVisibility => true).order(:galleryPosition).paginate(:page => params[:page], :per_page => 6)
    @numberOfImages = PhotoGallery.count
  end

  def admin_gallery_index
    @gallery = PhotoGallery.all.order(:galleryPosition)
  end

  def new
    @gallery = PhotoGallery.new()
    @counter = PhotoGallery.count + 1
  end

  def create
    @gallery = PhotoGallery.new(required_parameters)
      if @gallery.save
        flash[:alert] = "Photo Gallery sucessfully created"
        redirect_to(:controller => 'photo_galleries', :action => 'admin_gallery_index')
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
    if @gallery.update(required_parameters)
      flash[:alert] = "Photo Gallery sucessfully updated"
      redirect_to(:controller => 'photo_galleries', :action => 'admin_gallery_index')
    else
      @counter = PhotoGallery.count
      render('edit')
    end
  end

  def show
    @gallery = PhotoGallery.friendly.find(params[:id])
    @weather_city = PhotoGallery.find(params[:id]).city
    @weather_results = WeatherStation.search(@weather_city)
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
    params.require(:photo_gallery).permit(:gallerytitle, :galleryDescription, :galleryQuoteText, :galleryQuoteAuthor, :galleryPosition, :galleryVisibility, :galleryAuthor, :country, :city, :galleryImageHeader, uploads: [])
  end

end
