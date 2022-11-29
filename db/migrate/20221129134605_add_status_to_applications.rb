class AddStatusToApplications < ActiveRecord::Migration[7.0]
  def change
    add_column :applications, :status, :integer, :default => 0
  end
end
