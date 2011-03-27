class CreateProductOrders < ActiveRecord::Migration
  def self.up
    create_table :product_orders do |t|
      t.integer :quantity
      t.integer :order_id
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :product_orders
  end
end
