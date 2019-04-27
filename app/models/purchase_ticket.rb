class PurchaseTicket < ApplicationRecord
  validates :amount, presence: true
  belongs_to :purchase
  belongs_to :ticket
end
