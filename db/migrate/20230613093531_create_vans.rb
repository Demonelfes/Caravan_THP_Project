class CreateVans < ActiveRecord::Migration[7.0]
  def change
    create_table :vans do |t|
      t.string :title
      t.text :description
      t.string :city
      t.string :image_url
      t.boolean :is_van_pro

      t.string :brand
      t.string :registration #Plaque d'immatriculation
      t.boolean :is_manual_transmission
      t.integer :year
      t.string :energy

      t.integer :bed_number
      t.boolean :has_wc
      t.boolean :has_fridge
      t.boolean :has_shower

      t.integer :price_per_day
      t.references :user, index: true

      t.timestamps
    end
  end
end
