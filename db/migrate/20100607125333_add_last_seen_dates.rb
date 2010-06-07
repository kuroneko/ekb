class AddLastSeenDates < ActiveRecord::Migration
  def self.up
    add_column :alliances, :last_seen, :datetime
    add_column :corporations, :last_seen, :datetime
    add_column :pilots, :last_seen, :datetime
  end

  def self.down
    remove_column :alliances, :last_seen
    remove_column :corporations, :last_seen
    remove_column :pilots, :last_seen
  end
end
