class Skill < ApplicationRecord

  scope :alphabetical_order, lambda{order("skillName")}

end
