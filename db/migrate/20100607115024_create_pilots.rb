class CreatePilots < ActiveRecord::Migration
  def self.up
    create_table :pilots do |t|
      t.string :name, :length => 64, :null => false
      t.integer :corporation_id, :null => false
      t.integer :external_id
      t.integer :killpoints, :null => false, :default => 0
      t.integer :losspoints, :null => false, :default => 0
      t.timestamps
    end
    add_index :pilots, :name
    add_index :pilots, :killpoints
    add_index :pilots, :losspoints
  end

  def self.down
    remove_index :pilots, :name
    remove_index :pilots, :killpoints
    remove_index :pilots, :losspoints
    drop_table :pilots
  end
end
