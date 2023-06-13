class CreateVans < ActiveRecord::Migration[7.0]
  def change
    create_table :vans do |t|
      t.integer :manual_van_id
      t.string :title
      t.text :description
      t.string :city
      t.float :latitude
      t.float :longitude
      t.string :image_url

      t.string :brand
      t.boolean :is_manual_transmission
      t.integer :year
      t.string :energy

      t.integer :bed_number
      t.boolean :is_wc
      t.boolean :is_fridge
      t.boolean :is_shower

      t.integer :price_per_day
      t.references :user, index: true

      t.timestamps
    end
  end
end
