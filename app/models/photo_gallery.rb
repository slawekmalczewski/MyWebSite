class PhotoGallery < ApplicationRecord

  extend FriendlyId
  friendly_id :gallerytitle, use: [:slugged, :finders]

  has_many :myPhotos, :dependent => :destroy
  has_one_attached :galleryImageHeader

  scope :published, lambda{where(:galleryVisibility => true)}

  after_commit :add_default_galleryImageHeader, on: [:create, :update]

  private def add_default_galleryImageHeader
    unless galleryImageHeader.attached?
      self.galleryImageHeader.attach(io: File.open(Rails.root.join("app", "assets", "images","defaultImage.png")), filename: 'defaultImage.png', content_type: "image/png")
    end
  end

end
