class CreateCorporations < ActiveRecord::Migration
  def self.up
    create_table :corporations do |t|
      t.string :name, :length => 64, :null => false
      t.integer :alliance_id, :null => true
      t.boolean :trial, :null => false, :default => false
      t.timestamps
    end
    add_index :corporations, :alliance_id
    add_index :corporations, :name
  end

  def self.down
    remove_index :corporations, :alliance_id
    remove_index :corporations, :name
    drop_table :corporations
  end
end
