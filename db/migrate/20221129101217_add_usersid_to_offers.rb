class AddUsersidToOffers < ActiveRecord::Migration[7.0]
  def change
    add_reference :offers, :club, foreign_key: true
  end
end
