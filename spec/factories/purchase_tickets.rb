FactoryBot.define do
  factory :purchase_ticket do
    purchase
    ticket
    amount { 1 }
  end
end
