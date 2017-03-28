class AddUseridToListingColumn < ActiveRecord::Migration[5.0]
  def change
  add_reference :listings, :user, foreign_key: true
  end
end


# for addimg column id
# add_column :listings, :user_id, :integer or use method below

# add_reference :listings, :user, foreign_key: true
#This migration will create a user_id column and appropriate index. Add ref has API doc.
