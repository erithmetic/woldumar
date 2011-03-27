class CreateEventTickets < ActiveRecord::Migration
  def self.up
    create_table :event_tickets do |t|
      t.integer :event_id
      t.string :name
      t.money :price

      t.timestamps
    end
  end

  def self.down
    drop_table :event_tickets
  end
end
