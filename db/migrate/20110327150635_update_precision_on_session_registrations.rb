class UpdatePrecisionOnSessionRegistrations < ActiveRecord::Migration
  def self.up
    change_column :session_registrations, :total_cost, :decimal, :precision => 10, :scale => 2, :default => 0.0
  end

  def self.down
    change_column :session_registrations, :total_cost, :decimal
  end
end
