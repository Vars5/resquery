class Notification < ActiveRecord::Base
  attr_accessible :active, :comment, :user, :group
  
  belongs_to :comment
  belongs_to :user
  belongs_to :group
  
  
end
