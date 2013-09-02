class Group < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :memberships_attributes, :user, :group
  
  #Associations
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  accepts_nested_attributes_for :memberships
  
  has_many :articles
  has_many :discussions
  has_many :notifications, dependent: :destroy
  has_many :links
  
  has_many :topics

  
end
