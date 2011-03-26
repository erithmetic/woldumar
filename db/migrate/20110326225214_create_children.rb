class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :children do |t|
      t.string      :first_name
      t.string      :last_name
      t.date        :birthdate
      t.integer     :age
      t.boolean     :male      
      t.timestamps
    end
  end

  def self.down
    drop_table :children
  end
end
