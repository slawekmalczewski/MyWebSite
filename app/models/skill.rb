class Skill < ApplicationRecord

  scope :alphabetical_order, lambda{order("skills.skillName ASC")}

end
