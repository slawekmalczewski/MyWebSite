class PublicController < ApplicationController

  layout "no_footer"

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all

  def index
    @latestpost = Post.published.last(1)
    @latestgallery = PhotoGallery.published.last(1)
    render layout: 'application'
  end

  def articles
    @post = Post.where(:Post_Visibility => true).paginate(:page => params[:page], :per_page => 6).order('created_at DESC')
    @category = PostCategory.all
  end


  def galleriesIndex
    @gallery = PhotoGallery.where(:galleryVisibility => true).paginate(:page => params[:page], :per_page => 6).order('created_at DESC')
    @numberOfImages = PhotoGallery.count
  end

  def galleryView
    @gallery = PhotoGallery.find(params[:id])
  end

  def post_view
    @post = Post.find(params[:id])
  end


  def news
  end

  def categories
  end

  def show
    @post = Post.find(params[:id])
  end


end
