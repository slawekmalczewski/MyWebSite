class MyPhotosController < ApplicationController

  layout "admin"

  before_action :check_login, :except => [:login, :loginProcess, :logout]


  def index
    @galleryid = PhotoGallery.find(params[:id])
    @myPhotography = MyPhoto.all.where(:photo_gallery_id => @galleryid)
  end

  def new
    @myPhotography = MyPhoto.new({:myPhotoTitle => "Enter Photo Title"})
    @myPhotoCategory = PhotoGallery.all
    @counter = MyPhoto.count + 1
  end

  def create
    @myPhotography = MyPhoto.new(required_parameters)
    if @myPhotography.save
      flash[:success] = "Photograph added sucessfully"
      redirect_to(:controller => 'photo_galleries', :action => 'index')
    else
      @myPhotoCategory = PhotoGallery.order('galleryPosition ASC')
      @counter = MyPhoto.count + 1
      render('new')
    end
  end

  def edit
    @myPhotography = MyPhoto.find(params[:id])
    @myPhotoCategory = PhotoGallery.order('gallerytitle')
    @counter = MyPhoto.count
  end

  def update
    @myPhotography = MyPhoto.find(params[:id])
    if @myPhotography.update_attributes(required_parameters)
      flash[:success] = "Photograph's information sucessfully updated"
      redirect_to(:action => 'show', :id => @myPhotography.id)
    else
      @myPhotoCategory = PhotoGallery.order('gallerytitle')
      @counter = MyPhoto.count
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
    flash[:success] = "Photograph delted sucessfully"
  end

  def show
    @myPhotography = MyPhoto.find(params[:id])
  end

private

  def required_parameters
    params.require(:my_photo).permit(:photo_gallery_id, :myPhotoTitle, :myPhotoDescription, :myPhotoPosition, :myPhotoVisibility, :myPhotoLocation, :myPhotoISO, :myPhotoAperture, :myPhotoShutterSpeed, :myPhotograph)
  end

end
