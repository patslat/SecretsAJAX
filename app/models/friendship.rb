class Friendship < ActiveRecord::Base
  attr_accessible :friendee_id, :friender_id

  belongs_to :friender, class_name: "User"
  belongs_to :friendee, class_name: "User"

end
