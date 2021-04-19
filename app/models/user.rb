class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true, length: { minimum: 2}
  validates :email, presence: true, uniqueness: true
end
