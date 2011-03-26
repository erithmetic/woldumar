class CreateEventRegistrations < ActiveRecord::Migration
  def self.up
    create_table :event_registrations do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :cc_auth

      t.timestamps
    end
  end

  def self.down
    drop_table :event_registrations
  end
end
