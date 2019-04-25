class Location < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
end
