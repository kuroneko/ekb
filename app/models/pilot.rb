class Pilot < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :corporation, :on => :create, :message => "must exist"
  belongs_to :corporation, :class_name => "Corporation", :foreign_key => "corporation_id"
  has_many :losses, :class_name => "Kill", :foreign_key => "victim_pilot_id"
  has_many :finalblows, :class_name => "Kill", :foreign_key => "finalblow_pilot_id"
end
