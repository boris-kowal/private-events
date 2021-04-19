class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :subscriptions, foreign_key: :events_attended_id
  has_many :attendees, through: :subscriptions, source: :attendees
end
