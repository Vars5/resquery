class Link < ActiveRecord::Base
  attr_accessible :link, :title, :user_id, :group_id

  belongs_to :group

  validates :title, :presence => true
  validates :link, :presence => true



end
