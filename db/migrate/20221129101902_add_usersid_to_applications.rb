class AddUsersidToApplications < ActiveRecord::Migration[7.0]
  def change
    add_reference :applications, :user, foreign_key: true
  end
end
