class ArtworkGallery < ApplicationRecord
  has_many :artworks, :dependent => :destroy
  has_one_attached :artworkGalleryMainImage
end
