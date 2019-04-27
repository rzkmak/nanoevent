class PurchaseTicket < ApplicationRecord
  belongs_to :purchase
  belongs_to :ticket
end
