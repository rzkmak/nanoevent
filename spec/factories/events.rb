FactoryBot.define do
  factory :event do
    name { 'MockEvent' }
    organizer { 'MockOrganizer' }
    capacity { 1 }
    start_date { '2019-04-26 06:46:02' }
    end_date { '2019-04-27 06:46:02' }
    location
  end
end
