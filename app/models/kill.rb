class Kill < ActiveRecord::Base
  belongs_to :victim_pilot, :class_name => "Pilot", :foreign_key => "victim_pilot_id"
  belongs_to :victim_corporation, :class_name => "Corporation", :foreign_key => "victim_corporation_id"
  belongs_to :victim_alliance, :class_name => "Alliance", :foreign_key => "victim_alliance_id"
  belongs_to :finalblow_pilot, :class_name => "Pilot", :foreign_key => "finalblow_pilot_id"
  belongs_to :finalblow_corporation, :class_name => "Corporation", :foreign_key => "finalblow_corporation_id"
  belongs_to :finalblow_alliance, :class_name => "Alliance", :foreign_key => "finalblow_alliance_id"
end
