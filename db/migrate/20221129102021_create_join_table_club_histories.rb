class CreateJoinTableClubHistories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :clubs, table_name: :club_histories
  end
end
