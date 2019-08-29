class PublicController < ApplicationController

  layout "public"

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @latestpost = Post.published.last(1)
    @latestgallery = PhotoGallery.published.last(1)
    render layout: 'publicIndex'
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

  def articleView
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
