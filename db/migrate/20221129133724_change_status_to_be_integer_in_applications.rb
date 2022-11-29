class ChangeStatusToBeIntegerInApplications < ActiveRecord::Migration[7.0]
  def change
    remove_column :applications, :status
  end
end
