class Article < ActiveRecord::Base
  attr_accessible :body, :name, :articletopic_attributes, :user_id, :topic_id, :group_id

  has_many :articletopics
  has_many :topics, through: :articletopics

  belongs_to :groups

  accepts_nested_attributes_for :articletopics
  
  validates :body, :presence => true
  validates :name, :presence => true
  
  
end
