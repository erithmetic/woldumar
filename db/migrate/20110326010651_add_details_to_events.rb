class AddDetailsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :details, :text
    add_column :events, :start_date, :datetime
    add_column :events, :end_date, :datetime
  end

  def self.down
    remove_column :events, :details, :text
    remove_column :events, :start_date, :datetime
    remove_column :events, :end_date, :datetime
  end
end
