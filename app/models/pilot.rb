class Pilot < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :corporation, :on => :create, :message => "must exist"
  belongs_to :corporation, :class_name => "Corporation", :foreign_key => "corporation_id"
end
