class AddEventIdToOccurrences < ActiveRecord::Migration
  def self.up
    add_column :occurrences, :event_id, :integer
  end

  def self.down
    remove_column :occurrences, :event_id
  end
end
