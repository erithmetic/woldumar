class UpdatePrecisionOnCamps < ActiveRecord::Migration
  def self.up
    change_column :camps, :fee, :decimal, :precision => 8, :scale => 2
    change_column :camps, :discount, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    change_column :camps, :fee, :decimal
    change_column :camps, :discount, :decimal
  end
end
