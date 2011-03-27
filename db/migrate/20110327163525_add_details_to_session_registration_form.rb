class AddDetailsToSessionRegistrationForm < ActiveRecord::Migration
  def self.up
    add_column :session_registrations, :parent2_first_name, :string
    add_column :session_registrations, :parent2_last_name, :string
    add_column :session_registrations, :parent2_home_phone, :string
    add_column :session_registrations, :parent2_work_phone, :string
    add_column :session_registrations, :parent2_other_phone, :string
    add_column :session_registrations, :parent2_email, :string
  end

  def self.down
    remove_column :session_registrations, :parent2_first_name
    remove_column :session_registrations, :parent2_last_name
    remove_column :session_registrations, :parent2_home_phone
    remove_column :session_registrations, :parent2_work_phone
    remove_column :session_registrations, :parent2_other_phone
    remove_column :session_registrations, :parent2_email
  end
end
