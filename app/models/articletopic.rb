class Articletopic < ActiveRecord::Base
  attr_accessible :article_id, :parent, :topic_id, :user_id
  
  belongs_to :article
  belongs_to :topic
  
  
end
