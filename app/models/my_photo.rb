class MyPhoto < ApplicationRecord
  belongs_to :photo_gallery

  has_one_attached :myPhotograph

  validates :myPhotoTitle, presence: true
  validates :myPhotoDescription, presence:true

  scope :published, lambda{where(:myPhotoVisibility => true)}

  # DZIALA PO ZROBIENIU UPDATE before_commit :save_latitude, on: :update


  private

#  def save_latitude
#    #lat =  ActiveStorage::Blob.last.metadata[:latitude]
#    latex = MyPhoto.last.myPhotograph.blob.metadata.fetch(:longitude,nil)
#    #update_column(:latitude, lat)
#    MyPhoto.last.update_attribute(:latitude, latex)
#  end

#  def save_latitude
#    if MyPhoto.new.myPhotograph.attached?
#      self.update_attribute(:latitude, 333)
#    else
#      lat = self.myPhotograph.blob.metadata.fetch(:longitude,nil)
#      self.update_attribute(:latitude, lat)
#    end
#  end



end
