class CreateEventTickets < ActiveRecord::Migration
  def self.up
    create_table :event_tickets do |t|
      t.integer :event_id
      t.string :name
      t.decimal :price, :precision => 10, :scale => 2, :default => 0.0

      t.timestamps
    end
  end

  def self.down
    drop_table :event_tickets
  end
end
