class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :subscriptions, foreign_key: :events_attended_id
  has_many :attendees, through: :subscriptions, source: :attendees

  scope :past, -> { where("date < ?", DateTime.current) }
  scope :upcoming, -> { where("date >= ?", DateTime.current) }

  # def self.past
  #   where("date < ?", DateTime.current)
  # end
  
  # def self.upcoming
  #   where("date >= ?", DateTime.current)
  # end
  
end
