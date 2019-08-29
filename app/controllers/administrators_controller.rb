class AdministratorsController < ApplicationController

  layout "admin"

  access all: [], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @post = Post.all
    @newestPost = Post.recent
    @gallery = PhotoGallery.all
    @photographs = MyPhoto.all
    @categories = PostCategory.all
    @user = User.all
  end

end
