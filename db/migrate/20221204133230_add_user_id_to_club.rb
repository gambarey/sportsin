class AddUserIdToClub < ActiveRecord::Migration[7.0]
  def change
    add_reference :clubs, :user, foreign_key: true
    add_column :clubs, :website, :string
  end
end
