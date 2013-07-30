class Discussion < ActiveRecord::Base
  attr_accessible :description, :group_id, :title, :user_id, :commentable, :body, :user_id
  
  after_save :send_notification_emails
  
  belongs_to :group
  
  #comments
  acts_as_commentable
  
  def send_notifications_emails
    group.users.where('sign_in_count > 0').each do |user|
      UserMailer.new_discussion(user, group, self, current_user).deliver
    end
  
  end
  
  
end
