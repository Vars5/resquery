class Link < ActiveRecord::Base
  attr_accessible :link, :title, :user_id, :group_id

  #associations
  belongs_to :group


end
