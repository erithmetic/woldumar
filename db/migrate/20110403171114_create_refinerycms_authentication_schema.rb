class CreateRefinerycmsAuthenticationSchema < ActiveRecord::Migration
  def self.up
    # Postgres apparently requires the roles_users table to exist before creating the roles table.
    create_table ::RolesUsers.table_name, :id => false, :force => true do |t|
      t.integer "user_id"
      t.integer "role_id"
    end

    create_table ::Role.table_name, :force => true do |t|
      t.string "title"
    end

    create_table ::UserPlugin.table_name, :force => true do |t|
      t.integer "user_id"
      t.string  "name"
      t.integer "position"
    end

    add_index ::UserPlugin.table_name, ["name"], :name => "index_#{::UserPlugin.table_name}_on_title"
    add_index ::UserPlugin.table_name, ["user_id", "name"], :name => "index_unique_#{::UserPlugin.table_name}", :unique => true
  end

  def self.down
    [::User].reject{|m|
      !(defined?(m) and m.respond_to?(:table_name))
    }.each do |model|
      drop_table model.table_name
    end
  end
end
