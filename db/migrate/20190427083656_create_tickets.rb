class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name, limit: 20
      t.integer :quota
      t.integer :price
      t.string :description, limit: 50
      t.datetime :start_sell
      t.datetime :end_sell
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
