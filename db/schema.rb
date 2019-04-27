# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_427_101_902) do
  create_table 'customers', force: :cascade do |t|
    t.string 'name', limit: 30
    t.string 'email', limit: 30
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'events', force: :cascade do |t|
    t.string 'name', limit: 20
    t.string 'organizer', limit: 50
    t.integer 'capacity'
    t.datetime 'start_date'
    t.datetime 'end_date'
    t.integer 'location_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['location_id'], name: 'index_events_on_location_id'
  end

  create_table 'locations', force: :cascade do |t|
    t.string 'name', limit: 50
    t.string 'address', limit: 50
    t.string 'city', limit: 20
    t.decimal 'longitude', precision: 10, scale: 6
    t.decimal 'latitude', precision: 10, scale: 6
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'purchases', force: :cascade do |t|
    t.integer 'customer_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['customer_id'], name: 'index_purchases_on_customer_id'
  end

  create_table 'tickets', force: :cascade do |t|
    t.string 'name', limit: 20
    t.integer 'quota'
    t.integer 'price'
    t.string 'description', limit: 50
    t.datetime 'start_sell'
    t.datetime 'end_sell'
    t.integer 'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_tickets_on_event_id'
  end

  create_table 'transaction_tickets', force: :cascade do |t|
    t.integer 'transaction_id'
    t.integer 'ticket_id'
    t.integer 'amount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ticket_id'], name: 'index_transaction_tickets_on_ticket_id'
    t.index ['transaction_id'], name: 'index_transaction_tickets_on_transaction_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.integer 'customer_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['customer_id'], name: 'index_transactions_on_customer_id'
  end
end
