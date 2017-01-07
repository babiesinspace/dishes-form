class AddNameToDish < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :name, :string, null: false 
  end
end
