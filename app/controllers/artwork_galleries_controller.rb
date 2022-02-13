class ArtworkGalleriesController < ApplicationController

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all

  def index
    @artworkgallery = ArtworkGallery.where(:artworkGalleryVisibility => true).order(:artworkGalleryPosition).paginate(:page => params[:page], :per_page => 6)
    @numberOfArtworksInGalleries = ArtworkGallery.count
  end


  def new
    @artworkgallery = ArtworkGallery.new()
    @counter = ArtworkGallery.count + 1
  end

  def create
    @artworkgallery = ArtworkGallery.new(required_parameters)
      if @artworkgallery.save
        flash[:alert] = "Photo Gallery sucessfully created"
        redirect_to(:controller => 'artwork_galleries', :action => 'index')
      else
        @counter = ArtworkGallery.count + 1
        render('new')
      end
  end

  def edit
    @artworkgallery = ArtworkGallery.find(params[:id])
    @counter = ArtworkGallery.count
  end

  def update
    @artworkgallery = ArtworkGallery.find(params[:id])
    if @artworkgallery.update(required_parameters)
      flash[:alert] = "Artwork Gallery sucessfully updated"
      redirect_to(:controller => 'artwork_galleries', :action => 'index')
    else
      @counter = ArtworkGallery.count
      render('edit')
    end
  end

  def show
    @artworkgallery = ArtworkGallery.find(params[:id])
  end

  def delete
    @artworkgallery = ArtworkGallery.find(params[:id])
  end



private

  def required_parameters
    params.require(:artwork_gallery).permit(:artworkGalleryTitle, :artworkGalleryDescription, :artworkGalleryPosition, :artworkGalleryVisibility, :artworkGalleryMainImage)
  end

end
