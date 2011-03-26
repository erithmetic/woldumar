class CreateAuthorizeNetCredentials < ActiveRecord::Migration
  def self.up
    create_table :authorize_net_credentials do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :authorize_net_credentials
  end
end
