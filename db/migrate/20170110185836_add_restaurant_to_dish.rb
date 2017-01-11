class AddRestaurantToDish < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :restaurant, :string
  end
end
