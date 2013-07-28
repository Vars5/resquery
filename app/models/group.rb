class Group < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :memberships_attributes
  
  #Associations
  has_many :memberships
  has_many :users, through: :memberships
  accepts_nested_attributes_for :memberships
  
  has_many :discussions
end
