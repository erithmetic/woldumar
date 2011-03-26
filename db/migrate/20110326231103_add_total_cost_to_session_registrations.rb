class AddTotalCostToSessionRegistrations < ActiveRecord::Migration
  def self.up
    add_column :session_registrations, :total_cost, :decimal
  end

  def self.down
    remove_column :session_registrations, :total_cost
  end
end
