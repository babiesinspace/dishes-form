class AddLatitudeAndLongitudeToDish < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :latitude, :float
    add_column :dishes, :longitude, :float
  end
end
