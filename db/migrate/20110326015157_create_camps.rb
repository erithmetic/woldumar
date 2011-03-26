class CreateCamps < ActiveRecord::Migration
  def self.up
    create_table :camps do |t|
      t.string :name
      t.integer :min_age
      t.integer :max_age
      t.datetime :start_time
      t.datetime :end_time
      t.text :details
      t.decimal :fee
      t.decimal :discount

      t.timestamps
    end
  end

  def self.down
    drop_table :camps
  end
end
