class Purchase < ApplicationRecord
  belongs_to :customer
  has_many :purchase_tickets
end
