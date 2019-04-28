class PurchaseSerializer < ActiveModel::Serializer
  type :purchase
  attributes :id, :customer, :purchase_tickets
end
