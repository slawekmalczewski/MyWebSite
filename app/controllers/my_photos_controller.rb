class MyPhotosController < ApplicationController

  layout "application"

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all

  def index
    @galleryid = PhotoGallery.find(params[:id])
    @myPhotography = MyPhoto.all.where(:photo_gallery_id => @galleryid)
  end

  def new
    @myPhotography = MyPhoto.new({:myPhotoTitle => "Enter Photo Title"})
    @myPhotoCategory = PhotoGallery.all
    #This will know to which gallery user wants to add photo, so the select field will be automatically positioned at the gallery name from which the request to add new photo was called
    @chosen_gallery = PhotoGallery.find(params[:id])
    @counter = MyPhoto.all.where(:photo_gallery_id => @chosen_gallery).count + 1
  end

  def create
    @myPhotography = MyPhoto.new(required_parameters)
    if @myPhotography.save
      flash[:alert] = "Photograph added sucessfully"
      redirect_to(:controller => 'my_photos', :action => 'verify_metadata')
    else
      flash[:alert] = "Error, could not add the photo"
      @myPhotoCategory = PhotoGallery.order('galleryPosition ASC')
      @counter = MyPhoto.count + 1
      render('new')
    end
  end

  def edit
    @myPhotography = MyPhoto.find(params[:id])
    gallery_where_photo_belongs_to = @myPhotography.photo_gallery_id
    @myPhotoCategory = PhotoGallery.order('gallerytitle')
    @counter = MyPhoto.all.where(:photo_gallery_id => gallery_where_photo_belongs_to).count
  end

  def update
    @myPhotography = MyPhoto.find(params[:id])
    if @myPhotography.update_attributes(required_parameters)
      flash[:alert] = "Photograph's information sucessfully updated"
      redirect_to(:action => 'show', :id => @myPhotography.id)
    else
      @myPhotoCategory = PhotoGallery.order('gallerytitle')
      @counter = MyPhoto.count
      flash[:error] = "There is a problem with updating information"
      render('edit')
    end
  end

  def delete
    @myPhotography = MyPhoto.find(params[:id])
  end

  def confirm_deletion
    @test = MyPhoto.find(params[:id]).photo_gallery_id
    @myPhotography = MyPhoto.find(params[:id]).destroy
    redirect_to(:controller => 'my_photos', :action => 'index', :id => @test)
    flash[:alert] = "Photograph delted sucessfully"
  end

  def show
    @myPhotography = MyPhoto.find(params[:id])
  end

  def verify_metadata
    @latestPhoto = MyPhoto.last
    @lon = MyPhoto.last.myPhotograph.blob.metadata.fetch(:longitude,nil)
  end

  def save_metadata
    @latestPhoto = MyPhoto.last
    lon = MyPhoto.last.myPhotograph.blob.metadata.fetch(:longitude,nil)
    lat = MyPhoto.last.myPhotograph.blob.metadata.fetch(:latitude,nil)
    MyPhoto.last.update_attributes(:latitude => lat, :longitude => lon)
    redirect_to(:action => 'show', :id => @latestPhoto.id)
  end

private

  def required_parameters
    params.require(:my_photo).permit(:photo_gallery_id, :myPhotoTitle, :myPhotoDescription, :myPhotoPosition, :myPhotoVisibility, :myPhotoLocation, :myPhotoISO, :myPhotoAperture, :myPhotoShutterSpeed, :myPhotograph)
  end

end
