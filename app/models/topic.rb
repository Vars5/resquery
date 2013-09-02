class Topic < ActiveRecord::Base
  attr_accessible :description, :group_id, :name, :user_id

  belongs_to :group
  
  has_many :articletopics
  has_many :articles, through: :articletopics





  def get_articles
    Article.where(:topic_id => self.id)
  end


end


