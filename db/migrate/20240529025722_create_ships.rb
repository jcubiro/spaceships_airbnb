class CreateShips < ActiveRecord::Migration[7.1]
  def change
    create_table :ships do |t|
      t.string :name
      t.text :description
      t.decimal :price_per_day
      t.date :available_from
      t.date :available_to
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
