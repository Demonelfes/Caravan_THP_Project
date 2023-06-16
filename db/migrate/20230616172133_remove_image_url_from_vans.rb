class RemoveImageUrlFromVans < ActiveRecord::Migration[7.0]
  def change
    remove_column :vans, :image_url, :string
  end
end
