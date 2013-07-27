class Group < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  
  #Associations
  has_many :users
  has_many :users, through: :memberships
  
  
end
