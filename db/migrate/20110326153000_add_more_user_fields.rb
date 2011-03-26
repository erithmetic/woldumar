class AddMoreUserFields < ActiveRecord::Migration
  
  def self.up
    add_column :users, :title, :string
    add_column :users, :middle_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :address_line_3, :string
    add_column :users, :home_phone, :string
    add_column :users, :work_phone, :string
    add_column :users, :work_phone_ext, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :fax, :string
    add_column :users, :notes, :text
  end

  def self.down
    remove_column :users, :title
    remove_column :users, :middle_name
    remove_column :users, :birth_date
    remove_column :users, :address_line_3
    remove_column :users, :home_phone
    remove_column :users, :work_phone
    remove_column :users, :work_phone_ext
    remove_column :users, :mobile_phone
    remove_column :users, :fax
    remove_column :users, :notes
  end
end
