class AddEmailToDish < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :email, :string
  end
end
