class Membership < ActiveRecord::Base
  attr_accessible :leader, :owner, :group_id, :user_id, :group, :user
  
  #association
  belongs_to :group
  belongs_to :user
  
  def self.create_or_invite(invite, current_user)
    group = Group.find(invite[:group_id])
    if user = User.find_by_email(invite[:email])
      UserMailer.new_group(user, current_user, group).deliver  
    else
      user = User.invite!({:email => invite[:email]}, current_user)
    end
    create(:group => group, :user => user)  
  end
  
  
end
