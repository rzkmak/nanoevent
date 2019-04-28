# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create([
                  {
                    name: 'Rizki Maulana',
                    email: 'me@rizki.my.id'
                  }])

Location.create([
                  {
                    name: "Jalan Bangka",
                    address: "Kebayoran Baru",
                    city: "Jaksel",
                    longitude: "0.0",
                    latitude: "0.0"
                  },
                  {
                    name: "Jalan Apel",
                    address: "Lowokwaru",
                    city: "Malang",
                    longitude: "0.0",
                    latitude: "0.0"
                  }
                ])

Event.create(
  [
    name: "Peringatan Hari Guru",
    organizer: "PGRI",
    capacity: 50,
    start_date: "2013-02-02T01:00:00.000Z",
    end_date: "2013-02-02T01:00:00.000Z",
    location_id: 1
  ])

Ticket.create(
  [
    "name": "Ticket Exclusive A",
    "quota": 10,
    "price": 50000,
    "start_sell": "2013-02-02 01:00:00",
    "end_sell": "2013-02-02 01:00:00",
    "event_id": 1,
    "description": "Exclusive ticket for special member"
  ]
)