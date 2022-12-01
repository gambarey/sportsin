class ChangeColumnAchievementsTypToSort < ActiveRecord::Migration[7.0]
  def change
    rename_column :achievements, :type, :sort
  end
end
