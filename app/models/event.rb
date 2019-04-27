class Event < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  belongs_to :location
end
