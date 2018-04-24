class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |table|
      table.string :name, null: false
      table.text :description, null: false
      table.string :location, null: false
      table.timestamps null: false
    end
  end
end
