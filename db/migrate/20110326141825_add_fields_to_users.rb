class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address_line_1, :string
    add_column :users, :address_line_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postal_code, :string
    add_column :users, :country, :string
    add_column :users, :is_admin, :boolean, :default => false
    add_column :users, :is_member, :boolean, :default => false
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :address_line_1
    remove_column :users, :address_line_2
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :postal_code
    remove_column :users, :country
    remove_column :users, :is_admin
    remove_column :users, :is_member
  end
end
