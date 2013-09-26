class Article < ActiveRecord::Base
  attr_accessible :body, :name, :articletopic_attributes, :user_id, :topic_id, :group_id, :large_slides

  has_many :articletopics
  has_many :topics, through: :articletopics

  belongs_to :groups

  accepts_nested_attributes_for :articletopics
  
  validates :body, :presence => true
  validates :name, :presence => true
  
  #comments
  acts_as_commentable
  
  
  before_save :add_ids_to_paragraphs
  
  def add_ids_to_paragraphs
    self.body.scan(/<p>.*?<\/p>/).each_with_index do |paragraph,index|
      self.body = self.body.sub(paragraph, paragraph.sub("<p>","<p id='#{index+1}_'>"))
    end
  end

  after_create :enqueue_create_document_job
  #after_destroy :enqueue_delete_document_job

  private

  def enqueue_create_document_job
    Delayed::Job.enqueue CreateSwiftypeDocumentJob.new(self.id)
  end

=begin
  def enqueue_delete_document_job
    DeleteSwiftypeDocumentJob.new(self.id)
  end
=end

end
