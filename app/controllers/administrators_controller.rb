class AdministratorsController < ApplicationController

  layout "admin"

  access all: [], user: {except: [:destroy, :new, :create, :update, :edit, :index]}, site_admin: :all, editor: :all

  def index
    @post = Post.all
    @newestPost = Post.first
    @gallery = PhotoGallery.all
    @photographs = MyPhoto.all
    @categories = PostCategory.all
    @user = User.all
  end

end
