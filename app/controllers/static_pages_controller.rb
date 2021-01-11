class StaticPagesController < ApplicationController


    access all: [:about, :portfolio], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all

    def about
      render layout: 'about_layout'
    end

    def portfolio
      @artworkGallery = ArtworkGallery.all
      @skill = Skill.all.alphabetical_order

    end

end
