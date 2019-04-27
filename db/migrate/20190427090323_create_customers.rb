class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, limit: 30
      t.string :email, limit: 30

      t.timestamps
    end
  end
end
