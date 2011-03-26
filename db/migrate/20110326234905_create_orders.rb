class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :cc_auth
      t.datetime :date
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
