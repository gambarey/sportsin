class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :position, :string
    add_column :users, :role, :string
    add_column :users, :description, :text
  end
end
