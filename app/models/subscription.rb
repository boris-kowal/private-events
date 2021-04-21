class Subscription < ApplicationRecord
  belongs_to :events_attended, class_name: "Event"
  belongs_to :attendees, class_name: "User"
  validates :events_attended_id, :uniqueness => { :scope => :attendees_id }
end
