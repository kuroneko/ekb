class Corporation < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  belongs_to :alliance
  has_many :pilots
end
