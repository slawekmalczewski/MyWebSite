class PhotoGallery < ApplicationRecord

  has_many :myPhotos
  has_one_attached :galleryImageHeader

  scope :published, lambda{where(:galleryVisibility => true)}

end
