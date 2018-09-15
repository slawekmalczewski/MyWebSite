class PostCategory < ApplicationRecord

  has_many :posts, :dependent => :restrict_with_error
  scope :newest, lambda{order("post_categories.created_at DESC")}

end
