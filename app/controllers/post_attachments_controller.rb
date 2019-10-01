class PostAttachmentsController < ApplicationController

  layout "application"
  layout "admin", :only => "show"

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all, editor: :all

  def index
    @attachments = Post.find(params[:id])
  end

  def delete
    fileToDelete = ActiveStorage::Attachment.find(params[:id])
    fileToDelete.purge
    #refresh the page after deleting attached file
    redirect_to request.referrer
    flash[:alert] = "File attachment(s) sucessfully delted"
  end

  def show
    @attachments = Post.find(params[:id])
  end

end
