class AddUserRefToAchivements < ActiveRecord::Migration[7.0]
  def change
    add_reference :achievements, :user, foreign_key: true
  end
end
