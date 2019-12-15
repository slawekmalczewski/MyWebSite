class StaticPagesController < ApplicationController

    layout "about_layout"

    access all: [:about], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all

    def about

    end

end
