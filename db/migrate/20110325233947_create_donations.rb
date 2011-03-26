class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.string :in_memory_of
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.decimal :amount, :precision => 10, :scale => 2, :default => 0.0
      t.integer :cc_auth

      t.timestamps
    end
  end

  def self.down
    drop_table :donations
  end
end
