class Artwork < ApplicationRecord

  belongs_to :artwork_gallery
  has_one_attached :artworkPiece

end
