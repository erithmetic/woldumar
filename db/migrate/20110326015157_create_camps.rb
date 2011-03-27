class CreateCamps < ActiveRecord::Migration
  def self.up
    create_table :camps do |t|
      t.string :name
      t.integer :min_age
      t.integer :max_age
      t.datetime :start_time
      t.datetime :end_time
      t.text :details
      t.decimal :fee, :precision => 10, :scale => 2, :default => 0.01
      t.decimal :discount, :precision => 10, :scale => 2, :default => 0.0

      t.timestamps
    end
  end

  def self.down
    drop_table :camps
  end
end
