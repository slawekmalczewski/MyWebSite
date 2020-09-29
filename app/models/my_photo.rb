class MyPhoto < ApplicationRecord
  belongs_to :photo_gallery

  has_one_attached :myPhotograph

  before_save :verify_coordinates
  after_update :verify_coordinates, :verify_possibility_to_show_on_the_map

  validates :myPhotoTitle, presence: true
  validates :myPhotoDescription, presence: true

  scope :published, lambda{where(:myPhotoVisibility => true)}

  reverse_geocoded_by :latitude, :longitude,
    :location => :address
  after_validation :reverse_geocode

  def address
    [latitude,longitude].compact.join(", ")
  end

  def get_image_link
    Rails.application.routes.url_helpers.rails_blob_path(myPhotograph, only_path: true)
  end

  def verify_coordinates
    if self.longitude_reference == 'W' && self.longitude > 0
      self.longitude = (-1)*self.longitude
      [latitude,longitude].compact.join(", ")
    elsif self.longitude_reference == 'W' && self.longitude < 0
      [latitude,longitude].compact.join(", ")
    elsif self.latitude_reference == 'N' && self.latitude < 0
      self.latitude = (-1)*self.latitude
      [latitude,longitude].compact.join(", ")
    elsif self.latitude_reference == 'N' && self.latitude > 0
      [latitude,longitude].compact.join(", ")
    else
      [latitude,longitude].compact.join(", ")
    end
  end

  def verify_possibility_to_show_on_the_map
    if ((self.longitude == nil) && (self.latitude == nil))
      self.show_on_map = 0
    end
  end

  def self.get_latest_photo_uploaded_and_published
    new_photo_published = MyPhoto.where(:myPhotoVisibility => true).order(created_at: :desc).first
  end


  private

end
