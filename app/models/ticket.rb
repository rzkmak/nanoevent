class Ticket < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :quota, presence: true
  validates :price, presence: true
  belongs_to :event
end
