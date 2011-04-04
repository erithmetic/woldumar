class ChangeToDeviseUsersTable < ActiveRecord::Migration
  def self.up
  end

  def self.down
    remove_column ::User.table_name, :current_sign_in_at
    remove_column ::User.table_name, :last_sign_in_at
    remove_column ::User.table_name, :current_sign_in_ip
    remove_column ::User.table_name, :last_sign_in_ip
    remove_column ::User.table_name, :sign_in_count
    remove_column ::User.table_name, :remember_token
    remove_column ::User.table_name, :reset_password_token

    rename_column ::User.table_name, :encrypted_password, :crypted_password
    rename_column ::User.table_name, :username, :login
  end
end
