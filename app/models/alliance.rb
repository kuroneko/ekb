class Alliance < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  
end
