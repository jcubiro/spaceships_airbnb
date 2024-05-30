class CreateJoinTableShipCategory < ActiveRecord::Migration[7.1]
  def change
    create_join_table :ships, :categories do |t|
      t.index :ship_id
      t.index :category_id
    end
  end
end
