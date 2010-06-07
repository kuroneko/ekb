class CreateAttackers < ActiveRecord::Migration
  def self.up
    create_table :attackers do |t|
      t.integer :kill_id, :null => false
      t.integer :pilot_id, :null => true
      t.integer :corporation_id, :null => false
      t.integer :alliance_id, :null => true
      t.boolean :final_blow, :null => false, :default => false
      t.integer :damage_done, :null => false, :default => 0
      t.timestamps
    end
    add_index :attackers, :pilot_id
    add_index :attackers, :kill_id
    add_index :attackers, [:corporation_id, :pilot_id]
    add_index :attackers, [:alliance_id, :corporation_id, :pilot_id]
  end

  def self.down
    drop_table :attackers
  end
end
