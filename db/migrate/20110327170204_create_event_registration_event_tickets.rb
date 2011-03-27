class CreateEventRegistrationEventTickets < ActiveRecord::Migration
  def self.up
    create_table :event_registration_event_tickets do |t|
      t.integer :event_registration_id
      t.integer :event_ticket_id

      t.timestamps
    end
  end

  def self.down
    drop_table :event_registration_event_tickets
  end
end
