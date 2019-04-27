class Ticket < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  belongs_to :event
end
