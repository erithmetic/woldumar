class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.date :start_date
      t.date :end_date
      t.integer :camp_id
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
