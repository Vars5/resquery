class Discussion < ActiveRecord::Base
  attr_accessible :description, :group, :title, :user_id, :commentable, :body, :link
  
  after_create :send_notification_emails
  
  belongs_to :group
  
  #comments
  acts_as_commentable


  def author
    User.find_by_id(self.user_id)
  end
  
  def authors_first_name
    self.author.first_name
  end
  
  def authors_last_name
    self.author.last_name
  end

  
  def send_notification_emails
    #group = self.group
    current_user = User.find_by_id(self.user_id)
    
    group.users.where('sign_in_count > 0').each do |user| 
      UserMailer.new_discussion(user, group, self, current_user).deliver unless user == current_user
    end
  
  end
  
  
end
