class CreateSessionChildRegistrations < ActiveRecord::Migration
  def self.up
    create_table :session_child_registrations do |t|
      t.integer :session_id
      t.integer :child_id
      t.decimal :extended_care_cost
      t.boolean :photo
      t.boolean :early_discount
      t.decimal :total_fees
      t.timestamps
    end
  end

  def self.down
    drop_table :session_child_registrations
  end
end
