class RemoveUnusedDonationColumns < ActiveRecord::Migration
  def self.up
    remove_column :donations, "first_name"
    remove_column :donations, "last_name"
    remove_column :donations, "email"
    remove_column :donations, "address"
    remove_column :donations, "city"
    remove_column :donations, "state"
    remove_column :donations, "zip"
    remove_column :donations, "phone"
  end

  def self.down
  end
end
