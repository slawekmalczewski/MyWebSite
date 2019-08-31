class StaticPagesController < ApplicationController

    layout "application"

    access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all

    def about

    end


end
