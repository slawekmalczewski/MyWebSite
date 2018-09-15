class PostAttachmentsController < ApplicationController

  layout "admin"
  
  before_action :check_login, :except => [:login, :loginProcess, :logout]

  def index
  end

  def delete
    fileToDelete = ActiveStorage::Attachment.find(params[:id])
    fileToDelete.purge
    #refresh the page after deleting attached file
    redirect_to request.referrer
    flash[:attachmentNotice] = "File attachment(s) sucessfully delted"
  end

  def show
    @attachments = Post.find(params[:id])
  end

end
