class Discussion < ActiveRecord::Base
  attr_accessible :description, :group_id, :title, :user_id, :commentable, :body, :user_id
  
  belongs_to :group
  
  #comments
  acts_as_commentable
  
  
  
  
end
