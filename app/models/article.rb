class Article < ActiveRecord::Base
  attr_accessible :body, :name, :articletopic_attributes

  has_many :articletopics
  has_many :topics, through: :articletopics

  accepts_nested_attributes_for :articletopics
  
  
  
end
