class Corporation < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  belongs_to :alliance
  has_many :pilots
  has_many :losses, :class_name => "Kill", :foreign_key => "victim_corporation_id"
  has_many :finalblows, :class_name => "Kill", :foreign_key => "finalblow_corporation_id"
end
