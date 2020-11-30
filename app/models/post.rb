class Post < ApplicationRecord

  extend FriendlyId
  friendly_id :Post_Title, use: [:slugged, :finders]

  belongs_to :post_category

  has_one_attached :postHeaderPhoto
  has_many_attached :uploads

  has_many :comments

  validates :Post_Title, presence: true
  validates :Post_Author, presence: true
  validates :Post_Body, presence: true

  scope :newest, lambda{order("posts.created_at DESC").where(:Post_Visibility => true)}
  scope :recent, lambda{order("posts.created_at DESC").limit(1)}
  scope :published, lambda{where(:Post_Visibility => true)}

  after_commit :add_default_postHeaderPhoto, on: [:create, :update]

  private def add_default_postHeaderPhoto
    unless postHeaderPhoto.attached?
      self.postHeaderPhoto.attach(io: File.open(Rails.root.join("app", "assets", "images","defaultImage.png")), filename: 'defaultImage.png', content_type: "image/png")
    end
  end

end
