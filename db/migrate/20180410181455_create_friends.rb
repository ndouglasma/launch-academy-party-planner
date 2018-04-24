class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |table|
      table.string :first_name, null: false
      table.string :last_name, null: false
      table.timestamps null: false
    end
  end
end
