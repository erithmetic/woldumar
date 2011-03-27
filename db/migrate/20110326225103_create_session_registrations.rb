class CreateSessionRegistrations < ActiveRecord::Migration
  def self.up
    create_table :session_registrations do |t|
      t.integer :user_id
      t.integer :cc_auth
      
      t.timestamps
    end
  end

  def self.down
    drop_table :session_registrations
  end
end
