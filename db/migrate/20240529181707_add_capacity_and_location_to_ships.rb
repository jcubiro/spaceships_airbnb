class AddCapacityAndLocationToShips < ActiveRecord::Migration[7.1]
  def change
    add_column :ships, :capacity, :integer
    add_column :ships, :location, :string
  end
end
