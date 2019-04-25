class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, limit: 50
      t.string :address, limit: 50
      t.string :city, limit: 20
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :latitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
