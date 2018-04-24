class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |table|
      table.belongs_to :party
      table.belongs_to :friend
      table.boolean :rsvp, null: false
      table.timestamps null: false
    end
  end
end
