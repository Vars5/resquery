class Discussion < ActiveRecord::Base
  attr_accessible :description, :group_id, :title, :user_id
  
  belongs_to :group
  
end