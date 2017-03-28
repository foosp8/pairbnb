class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :location
      t.string :description
      t.integer :no_rooms
      t.integer :no_beds
      t.timestamps
    end
  end
end
