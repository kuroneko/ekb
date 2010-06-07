class CreateKills < ActiveRecord::Migration
  def self.up
    create_table :kills do |t|
      t.datetime :killtime
      t.integer :victim_pilot_id, :null => true
      t.integer :victim_corporation_id, :null => false
      t.integer :victim_alliance_id, :null => true
      t.integer :finalblow_pilot_id, :null => true
      t.integer :finalblow_corporation_id, :null => true
      t.integer :finalblow_alliance_id, :null => true
      t.integer :points, :null => false, :default => 0
      t.integer :damage_taken, :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :kills
  end
end
