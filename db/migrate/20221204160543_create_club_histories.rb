class CreateClubHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :club_histories do |t|
      t.references :club, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :jersey_number
      t.timestamps
    end
  end
end
