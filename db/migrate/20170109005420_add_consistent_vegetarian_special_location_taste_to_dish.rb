class AddConsistentVegetarianSpecialLocationTasteToDish < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :consistent, :boolean
    add_column :dishes, :vegetarian, :boolean
    add_column :dishes, :special, :boolean
    add_column :dishes, :location, :string
    add_column :dishes, :taste, :integer
  end
end
