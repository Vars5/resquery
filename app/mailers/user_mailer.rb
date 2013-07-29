class UserMailer < ActionMailer::Base
  default from: "notifications@resquery.com"
  
  def new_group(user, current_user, group)
    @user = user
    @current_user = current_user
    
    mail to: user.email, 
    subject:"#{current_user.first_name} invited you to #{group.name}  - ResQuery",
    from: current_user.email 
  end

  def new_discussion(user, group, discussion, current_user)
    @user = user
    @current_user = current_user
    @group = group
    @discussion = discussion

    mail to: user.email,
    subject: "#{current_user.first_name} created a new discussion in #{group.name} - ResQuery"
  end
  
end
