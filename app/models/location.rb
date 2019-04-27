class Location < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :address, presence: true, length: { minimum: 5, maximum: 50 }
  validates :city, presence: true, length: { minimum: 2, maximum: 20 }
  validates :latitude, presence: true
  validates :longitude, presence: true
  has_many :events
end
