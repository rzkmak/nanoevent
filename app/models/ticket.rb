class Ticket < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :quota, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 50 }
  belongs_to :event
end
