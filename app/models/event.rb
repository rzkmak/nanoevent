class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  belongs_to :location
end
