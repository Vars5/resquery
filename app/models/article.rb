class Article < ActiveRecord::Base
  attr_accessible :body, :name, :articletopic_attributes, :user_id, :topic_id, :group_id

  has_many :articletopics
  has_many :topics, through: :articletopics

  belongs_to :groups

  accepts_nested_attributes_for :articletopics
  
  validates :body, :presence => true
  validates :name, :presence => true
  
  
  before_save :add_ids_to_paragraphs
  
  def add_ids_to_paragraphs
    self.body.scan(/<p>.*?<\/p>/).each_with_index do |paragraph,index|
      self.body = self.body.sub(paragraph, paragraph.sub("<p>","<p id='paragraph_#{index+1}'>"))
    end
  end


end
