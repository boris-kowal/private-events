class Subscription < ApplicationRecord
  belongs_to :events_attended, class_name: "Event"
  belongs_to :attendees, class_name: "User"
end
