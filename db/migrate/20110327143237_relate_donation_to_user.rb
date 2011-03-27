class RelateDonationToUser < ActiveRecord::Migration
  def self.up
    add_column :donations, :user_id, :integer
  end

  def self.down
    remove_column :donations, :user_id
  end
end
