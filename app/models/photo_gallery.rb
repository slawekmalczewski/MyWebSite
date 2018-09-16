class PhotoGallery < ApplicationRecord

  has_many :myPhotos
  has_one_attached :galleryImageHeader

  scope :published, lambda{where(:galleryVisibility => true)}

  after_commit :add_default_galleryImageHeader, on: [:create, :update]

  private def add_default_galleryImageHeader
    unless galleryImageHeader.attached?
      self.galleryImageHeader.attach(io: File.open(Rails.root.join("app", "assets", "images","defaultImage.png")), filename: 'defaultImage.png', content_type: "image/png")
    end
  end

end
