class Membership < ActiveRecord::Base
  attr_accessible :group_id, :leader, :owner, :user_id
  
  #association
  belongs_to :group
  belongs_to :user
  
  
end
