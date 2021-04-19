class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true, length: { minimum: 2}
  validates :email, presence: true, uniqueness: true
  has_many :events_created, class_name: "Event", foreign_key: "creator_id"
  has_many :subscriptions, foreign_key: :attendees_id
  has_many :events_attended, through: :subscriptions
end
