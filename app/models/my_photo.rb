class MyPhoto < ApplicationRecord
  belongs_to :photo_gallery

  has_one_attached :myPhotograph

  before_save :verify_coordinates
  after_update :verify_coordinates

  validates :myPhotoTitle, presence: true
  validates :myPhotoDescription, presence:true

  scope :published, lambda{where(:myPhotoVisibility => true)}

  reverse_geocoded_by :latitude, :longitude,
    :location => :address
  after_validation :reverse_geocode

  def address
    [latitude,longitude].compact.join(", ")
  end

  def verify_coordinates
    if self.longitude_reference == 'W' && self.latitude_reference == 'N'
      self.longitude = (-1)*self.longitude
      [latitude,longitude].compact.join(", ")
    elsif self.longitude_reference == 'E' && self.latitude_reference == 'S'
      self.latitude = (-1)*self.latitude
      [latitude,longitude].compact.join(", ")
    elsif self.longitude_reference == 'W' && self.latitude_reference == 'S'
      self.latitude = (-1)*self.latitude
      self.longitude = (-1)*self.longitude
      [latitude,longitude].compact.join(", ")
    else
      [latitude,longitude].compact.join(", ")
    end

  end


  private

end
