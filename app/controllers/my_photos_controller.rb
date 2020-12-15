class MyPhotosController < ApplicationController

  layout "application"
  layout "admin", :only => "index"

  access all: [:show, :index, :photomap], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all

  def index
    @galleryid = PhotoGallery.find(params[:id])
    @myPhotography = MyPhoto.all.where(:photo_gallery_id => @galleryid).order(:myPhotoPosition)
  end

  def new
    @myPhotography = MyPhoto.new()
    @myPhotoCategory = PhotoGallery.all
    #This will know to which gallery user wants to add photo, so the select field will be automatically positioned at the gallery name from which the request to add new photo was called
    @chosen_gallery = PhotoGallery.find(params[:id])
    @counter = MyPhoto.all.where(:photo_gallery_id => @chosen_gallery).count + 1
  end

  def create
    @myPhotography = MyPhoto.new(required_parameters)
    if @myPhotography.save
      flash[:alert] = "Photograph uploaded sucessfully"
      redirect_to(:controller => 'my_photos', :action => 'verify_metadata')
    else
      flash[:alert] = "Error, could not upload the photo"
      @myPhotoCategory = PhotoGallery.order('galleryPosition ASC')
      @counter = MyPhoto.count + 1
      render :new
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
    if @myPhotography.update(required_parameters)
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
    #Retrive data from the blob object that has been uploaded
    lon = MyPhoto.last.myPhotograph.blob.metadata.fetch(:longitude,nil)
    lat = MyPhoto.last.myPhotograph.blob.metadata.fetch(:latitude,nil)
    lat_ref = MyPhoto.last.myPhotograph.blob.metadata.fetch(:lat_ref,nil)
    long_ref = MyPhoto.last.myPhotograph.blob.metadata.fetch(:long_ref,nil)
    camera_model = MyPhoto.last.myPhotograph.blob.metadata.fetch(:camera_model,nil)
    camera_make = MyPhoto.last.myPhotograph.blob.metadata.fetch(:camera_make,nil)
    aperture_value = MyPhoto.last.myPhotograph.blob.metadata.fetch(:aperture_value,nil)
    shutter_speed = MyPhoto.last.myPhotograph.blob.metadata.fetch(:shutter_speed,nil)
    iso = MyPhoto.last.myPhotograph.blob.metadata.fetch(:ISO,nil)
    original_date = MyPhoto.last.myPhotograph.blob.metadata.fetch(:original_date,nil)

    #update the table with the photo metadata
    MyPhoto.last.update(
      :latitude => lat,
      :latitude_reference => lat_ref,
      :longitude => lon,
      :longitude_reference => long_ref,
      :myPhotoISO => iso,
      :myPhotoAperture => aperture_value,
      :myPhotoShutterSpeed => shutter_speed,
      :camera_make => camera_make,
      :camera_model => camera_model,
      :original_date_time => original_date
    )

    redirect_to(:action => 'show', :id => @latestPhoto.id)
    flash[:alert] = "Metadata saved sucessfully"
  end

  def edit_metadata
    @myPhotography = MyPhoto.find(params[:id])
  end

  def reset_metadata
    @currentPhoto = MyPhoto.find(params[:id])
    lon = MyPhoto.find(params[:id]).myPhotograph.blob.metadata.fetch(:longitude,nil)
    lat = MyPhoto.find(params[:id]).myPhotograph.blob.metadata.fetch(:latitude,nil)
    lat_ref = MyPhoto.find(params[:id]).myPhotograph.blob.metadata.fetch(:lat_ref,nil)
    long_ref = MyPhoto.find(params[:id]).myPhotograph.blob.metadata.fetch(:long_ref,nil)
    camera_model = MyPhoto.find(params[:id]).myPhotograph.blob.metadata.fetch(:camera_model,nil)
    camera_make = MyPhoto.find(params[:id]).myPhotograph.blob.metadata.fetch(:camera_make,nil)
    aperture_value = MyPhoto.find(params[:id]).myPhotograph.blob.metadata.fetch(:aperture_value,nil)
    shutter_speed = MyPhoto.find(params[:id]).myPhotograph.blob.metadata.fetch(:shutter_speed,nil)
    iso = MyPhoto.find(params[:id]).myPhotograph.blob.metadata.fetch(:ISO,nil)
    original_date = MyPhoto.find(params[:id]).myPhotograph.blob.metadata.fetch(:original_date,nil)

    @currentPhoto.update(
      :latitude => lat,
      :latitude_reference => lat_ref,
      :longitude => lon,
      :longitude_reference => long_ref,
      :myPhotoISO => iso,
      :myPhotoAperture => aperture_value,
      :myPhotoShutterSpeed => shutter_speed,
      :camera_make => camera_make,
      :camera_model => camera_model,
      :original_date_time => original_date
    )

    redirect_to(:action => 'show', :id => @currentPhoto.id)
    flash[:alert] = "Metadata rest sucessfully"
  end

  def photomap
    @photomarkers = MyPhoto.all.where(:show_on_map => true)
    @galleries = PhotoGallery.all
  end

private

  def required_parameters
    params.require(:my_photo).permit(:photo_gallery_id, :myPhotoTitle, :myPhotoDescription, :myPhotoPosition, :myPhotoVisibility, :myPhotoLocation, :myPhotoISO, :myPhotoAperture, :myPhotoShutterSpeed, :myPhotograph, :latitude, :latitude_reference, :longitude, :longitude_reference, :camera_make, :camera_model, :original_date_time, :show_on_map)
  end

end
