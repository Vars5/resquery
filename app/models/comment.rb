class Comment < ActiveRecord::Base
  
  attr_accessible :commentable, :body, :user_id, :paragraph_id
  
  
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  validates :body, :presence => true
  validates :user, :presence => true

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_votable

  belongs_to :commentable, :polymorphic => true

  # NOTE: Comments belong to a user
  belongs_to :user
  
  #notifications
  has_many :notifications

  # Helper class method that allows you to build a comment
  # by passing a commentable object, a user_id, and comment text
  # example in readme
  def self.build_from(obj, user_id, comment, paragraph_id)
    new \
      :commentable => obj,
      :body        => comment,
      :user_id     => user_id,
      :paragraph_id => paragraph_id
  end

  #helper method to check if a comment has children
  def has_children?
    self.children.any?
  end

  # Helper class method to lookup all comments assigned
  # to all commentable types for a given user.
  scope :find_comments_by_user, lambda { |user|
    where(:user_id => user.id).order('created_at DESC')
  }

  # Helper class method to look up all comments for
  # commentable class name and commentable id.
  scope :find_comments_for_commentable, lambda { |commentable_str, commentable_id|
    where(:commentable_type => commentable_str.to_s, :commentable_id => commentable_id).order('created_at DESC')
  }

  # Helper class method to look up a commentable object
  # given the commentable class name and id
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end

=begin  

  after_create :create_notifications
  after_create :send_new_comment_emails
  
  
  def create_notifications
    group = commentable.group
    group.users.each do |user|
      Notification.create(:user => user, :group => group, :comment => self, :active => true ) unless self.user == user
    end
  end

  def send_new_comment_emails
    group = commentable.group
    comment = self
    discussion = self.commentable
    
    group.users.where('sign_in_count > 0').each do |user|
      UserMailer.new_comment(user, comment, discussion, group).deliver unless user.id == comment.user_id
    end
  end


  before_save :add_ids_to_paragraphs
  
  def add_ids_to_paragraphs
    self.body.match(/<p>.*<\/p>/).each_with_index do |paragraph,index|
      self.body = self.body.sub(paragraph, paragraph.sub("<p>","<p id='comment_#{id}_paragraph_#{index}'"))
    end
  end
=end

end
