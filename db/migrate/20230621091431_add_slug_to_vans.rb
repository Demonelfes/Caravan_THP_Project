class AddSlugToVans < ActiveRecord::Migration[7.0]
  def change
    add_column :vans, :slug, :string
    add_index :vans, :slug, unique: true
  end
end
