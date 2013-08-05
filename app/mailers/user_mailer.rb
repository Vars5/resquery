class UserMailer < ActionMailer::Base
  default from: "ResQuery <notifications@resquery.com>"
  
  def new_group(user, current_user, group)
    @user = user
    @current_user = current_user
    @group = group
    
    mail to: user.email, 
    from: "#{current_user.first_name} #{current_user.last_name} (ResQuery) <notifications@resquery.com>",
    subject: "#{current_user.first_name} invited you to #{group.name}"  
  end

  def new_discussion(user, group, discussion, current_user)
    @user = user
    @current_user = current_user
    @group = group
    @discussion = discussion

    mail to: user.email,
    #from: "#{current_user.first_name} #{current_user.last_name} (ResQuery) <notifications@resquery.com>",
    subject: "#{current_user.first_name} created a new discussion in #{group.name}"
  end
  
  def new_comment(user, comment, discussion, group)
    @user = user
    @comment = comment
    @discussion = discussion
    @group = group  
    
    mail to: user.email,
    subject: "A new comment was posted in #{discussion.title}"

  end
    
end
