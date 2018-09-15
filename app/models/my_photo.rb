class MyPhoto < ApplicationRecord
  belongs_to :photo_gallery

  has_one_attached :myPhotograph

  scope :published, lambda{where(:myPhotoVisibility => true)}

end
