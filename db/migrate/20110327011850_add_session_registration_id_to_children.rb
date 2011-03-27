class AddSessionRegistrationIdToChildren < ActiveRecord::Migration
  def self.up
    add_column :children, :session_registration_id, :integer
  end

  def self.down
    remove_column :children, :session_registration_id
  end
end
