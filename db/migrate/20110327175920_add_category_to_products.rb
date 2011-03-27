class AddCategoryToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :category, :string
    add_column :products, :option, :string
  end

  def self.down
  end
end
