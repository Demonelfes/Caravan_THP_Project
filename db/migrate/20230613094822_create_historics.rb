class CreateHistorics < ActiveRecord::Migration[7.0]
  def change
    create_table :historics do |t|
      t.integer :van_manual_van_id
      t.string :van_title
      t.text :van_description
      t.string :van_city
      t.float :van_latitude
      t.float :van_longitude

      t.string :van_brand
      t.boolean :van_is_manual_transmission
      t.integer :van_year
      t.string :van_energy

      t.integer :van_bed_number
      t.boolean :van_is_wc
      t.boolean :van_is_fridge
      t.boolean :van_is_shower

      t.integer :van_price_per_day
      t.references :van_user, index: true
      
      t.string :owner_email 
      t.boolean :owner_is_admin
      

      t.string :customer_email 
      t.boolean :customer_is_admin

      t.integer :order_id
      t.datetime :order_created_at
  
      t.integer :order_cart_id
      t.datetime :order_cart_start_date
      t.datetime :order_cart_end_date
      t.integer :order_cart_price
    end
  end
end
