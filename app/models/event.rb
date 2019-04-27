class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :organizer, presence: true, length: { minimum: 2, maximum: 50 }
  validates :capacity, presence: true
  belongs_to :location
end
