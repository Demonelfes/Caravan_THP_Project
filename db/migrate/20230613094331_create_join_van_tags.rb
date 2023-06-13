class CreateJoinVanTags < ActiveRecord::Migration[7.0]
  def change
    create_table :join_van_tags do |t|

      t.references :van, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
