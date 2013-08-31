class Topic < ActiveRecord::Base
  attr_accessible :description, :group_id, :name, :user_id

  belongs_to :group
  
  has_many :articletopics
  has_many :articles, through: :articletopics

end


