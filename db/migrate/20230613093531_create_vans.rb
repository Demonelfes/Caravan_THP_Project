class CreateVans < ActiveRecord::Migration[7.0]
  def change
    create_table :vans do |t|
      t.string :title
      t.text :description
      t.string :city
      t.float :latitude
      t.float :longitude
      t.string :image_url
      t.boolean :is_van_pro, default: "false"
      t.boolean :is_hidden, default: "false"

      t.string :brand
      t.string :registration
      t.boolean :is_manual_transmission, default: "false"
      t.integer :year
      t.string :energy

      t.integer :bed_number
      t.boolean :has_wc, default: "false"
      t.boolean :has_fridge, default: "false"
      t.boolean :has_shower, default: "false"

      t.integer :price_per_day
      t.references :user, index: true

      t.timestamps
    end
  end
end
