class Alliance < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  has_many :corporations
  has_many :losses, :class_name => "Kill", :foreign_key => "victim_alliance_id"
  has_many :finalblows, :class_name => "Kill", :foreign_key => "finalblow_alliance_id"
  has_many :attacks, :class_name => "Attacker", :foreign_key => "alliance_id"
  
  def self.find_or_create(name)
    a = find(:first, :conditions => { :name => name })
    if nil == a then
      a = create(:name => name)
      a.save!
    end
    return a
  end
end
