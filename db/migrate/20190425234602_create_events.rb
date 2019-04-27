class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, limit: 20
      t.string :organizer, limit: 50
      t.integer :capacity
      t.datetime :start_date
      t.datetime :end_date
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
