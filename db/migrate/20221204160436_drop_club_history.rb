class DropClubHistory < ActiveRecord::Migration[7.0]
  def change
    drop_table :club_histories, force: :cascade
  end
end
