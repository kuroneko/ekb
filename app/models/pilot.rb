class Pilot < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :corporation, :on => :create, :message => "must exist"
  belongs_to :corporation, :class_name => "Corporation", :foreign_key => "corporation_id"
  belongs_to :alliance, :class_name => "Alliance", :foreign_key => "alliance_id"
  has_many :losses, :class_name => "Kill", :foreign_key => "victim_pilot_id"
  has_many :finalblows, :class_name => "Kill", :foreign_key => "finalblow_pilot_id"
  has_many :attacks, :class_name => "Attacker", :foreign_key => "pilot_id"
  
  def self.find_or_create(name, corporation)
    # find the named pilot, updating their corp as necessary.
    # to make this easier, we start from the other end.
    corporation_obj = Corporation.find_or_create(corporation)
    pilot_obj = find(:first, :conditions => { :name => name })
    if nil == pilot_obj then
      pilot_obj = create(:name => name, :corporation => corporation_obj)
      pilot_obj.save!
    end
    pilot_obj
  end
  
  def update_membership(updatetime, corporation, alliance)
    unless nil == alliance then
      a = Alliance.find_or_create(alliance)
      if a.last_seen == nil or a.last_seen < updatetime then
        a.last_seen = updatetime
        a.save!
      end
    end
    corp = Corporation.find_or_create(corporation)
    if corp.last_seen == nil or corp.last_seen < updatetime then
      corp.alliance = self.alliance
      corp.last_seen = updatetime  
      corp.save!
    end
    if self.last_seen == nil or self.last_seen < updatetime then
      if nil == alliance then
        self.alliance = nil
      else
        self.alliance = Alliance.find_or_create(alliance)
      end
      self.corporation = corp
      self.last_seen = updatetime
      self.save!
    end
  end
end
