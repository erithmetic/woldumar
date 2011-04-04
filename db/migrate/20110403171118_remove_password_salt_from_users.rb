class RemovePasswordSaltFromUsers < ActiveRecord::Migration
  def self.up
  end

  def self.down
    add_column :users, :password_salt, :string
  end
end
