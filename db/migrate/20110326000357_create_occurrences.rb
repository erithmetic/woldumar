class CreateOccurrences < ActiveRecord::Migration
  def self.up
    create_table :occurrences do |t|
      t.datetime :start
      t.datetime :end
      t.decimal :price
      t.text :details

      t.timestamps
    end
  end

  def self.down
    drop_table :occurrences
  end
end
