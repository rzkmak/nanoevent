FactoryBot.define do
  factory :ticket do
    name { 'MockTicketName' }
    quota { 1 }
    price { 1 }
    description { 'MockTicketDescription' }
    start_sell { '2019-04-27 15:36:56' }
    end_sell { '2019-04-27 15:36:56' }
    event
  end
end
