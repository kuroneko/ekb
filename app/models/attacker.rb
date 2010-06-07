class Attacker < ActiveRecord::Base
  belongs_to :kill, :class_name => "Kill", :foreign_key => "kill_id"
  belongs_to :pilot, :class_name => "Pilot", :foreign_key => "pilot_id"
  belongs_to :corporation, :class_name => "Corporation", :foreign_key => "corporation_id"
  belongs_to :alliance, :class_name => "Alliance", :foreign_key => "alliance_id"
end
