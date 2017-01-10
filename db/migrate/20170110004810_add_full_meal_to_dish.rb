class AddFullMealToDish < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :full_meal, :boolean
  end
end
