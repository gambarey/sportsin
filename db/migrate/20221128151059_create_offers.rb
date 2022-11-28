class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :location
      t.text :description
      t.integer :fee

      t.timestamps
    end
  end
end
