class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :total_price

      t.references :customer, index: true
      t.references :owner, index: true
      t.references :van, index: true
      t.timestamps
    end
  end
end
