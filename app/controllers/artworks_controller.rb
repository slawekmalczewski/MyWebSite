class ArtworksController < ApplicationController

  access all: [], user: [], site_admin: :all

  def index

    if (params[:additional_param] == 'display_all')
      @artwork = Artwork.all
    else
      # This will only present artwork pieces associuated with the given artwork gallery
      @choosen_artwork_gallery = Artwork.find(params[:id])
      @artwork = Artwork.all.where(:artwork_gallery_id => @choosen_artwork_gallery)
    end

  end

  def new
    @artwork = Artwork.new()
    @artworkGallery = ArtworkGallery.all
  end

  def create
    @artwork = Artwork.new(required_parameters)
    if @artwork.save
      flash[:alert] = "Artwork sucessfully added"
      redirect_to(:controller => "administrators", :action => 'index')
    else
      flash[:alert] = "Problem with saving your artwork"
      render('new')
    end
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(required_parameters)
      flash[:alert] = "Artwork sucessfully updated"
      redirect_to post_path(@artwork)
    else
      flash[:alert] = "Problem with saving your changes"
      render('index')
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    render layout: 'application'
  end

  def delete
    @artwork = Artwork.find(params[:id]).destroy
    flash[:alert] = "Artwork sucessfully deleted"
  end

private

  def required_parameters
    params.require(:artwork).permit(:artworkTitle, :artworkDescription, :artwork_gallery_id, :artworkCreationDate, :artworkPiece)
  end

end
