class CreatePurchaseTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_tickets do |t|
      t.references :purchase, foreign_key: true
      t.references :ticket, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
