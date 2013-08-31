class Topic < ActiveRecord::Base
  attr_accessible :description, :group_id, :name, :user_id

  belongs_to :group

end


