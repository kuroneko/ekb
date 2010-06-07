class Alliance < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  has_many :corporations
  has_many :losses, :class_name => "Kill", :foreign_key => "victim_alliance_id"
  has_many :finalblows, :class_name => "Kill", :foreign_key => "finalblow_alliance_id"
end
