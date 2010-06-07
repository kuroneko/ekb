# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100607132459) do

  create_table "alliances", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_seen"
  end

  add_index "alliances", ["name"], :name => "index_alliances_on_name"

  create_table "attackers", :force => true do |t|
    t.integer  "kill_id",                           :null => false
    t.integer  "pilot_id"
    t.integer  "corporation_id",                    :null => false
    t.integer  "alliance_id"
    t.boolean  "final_blow",     :default => false, :null => false
    t.integer  "damage_done",    :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attackers", ["alliance_id", "corporation_id", "pilot_id"], :name => "index_attackers_on_alliance_id_and_corporation_id_and_pilot_id"
  add_index "attackers", ["corporation_id", "pilot_id"], :name => "index_attackers_on_corporation_id_and_pilot_id"
  add_index "attackers", ["kill_id"], :name => "index_attackers_on_kill_id"
  add_index "attackers", ["pilot_id"], :name => "index_attackers_on_pilot_id"

  create_table "corporations", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "alliance_id"
    t.boolean  "trial",       :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_seen"
  end

  add_index "corporations", ["alliance_id"], :name => "index_corporations_on_alliance_id"
  add_index "corporations", ["name"], :name => "index_corporations_on_name"

  create_table "kills", :force => true do |t|
    t.datetime "killtime"
    t.integer  "victim_pilot_id"
    t.integer  "victim_corporation_id",                   :null => false
    t.integer  "victim_alliance_id"
    t.integer  "finalblow_pilot_id"
    t.integer  "finalblow_corporation_id"
    t.integer  "finalblow_alliance_id"
    t.integer  "points",                   :default => 0, :null => false
    t.integer  "damage_taken",             :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pilots", :force => true do |t|
    t.string   "name",                          :null => false
    t.integer  "corporation_id",                :null => false
    t.integer  "external_id"
    t.integer  "killpoints",     :default => 0, :null => false
    t.integer  "losspoints",     :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_seen"
  end

  add_index "pilots", ["killpoints"], :name => "index_pilots_on_killpoints"
  add_index "pilots", ["losspoints"], :name => "index_pilots_on_losspoints"
  add_index "pilots", ["name"], :name => "index_pilots_on_name"

end
