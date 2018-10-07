class MyPhoto < ApplicationRecord
  belongs_to :photo_gallery

  has_one_attached :myPhotograph

  validates :myPhotoTitle, presence: true
  validates :myPhotoDescription, presence:true

  scope :published, lambda{where(:myPhotoVisibility => true)}

  private

end
