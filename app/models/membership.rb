class Membership < ActiveRecord::Base
  attr_accessible :leader, :owner, :group_id, :user_id, :group, :user
  
  #association
  belongs_to :group
  belongs_to :user
  
  def self.create_or_invite(invite, current_user)
    group = Group.find(invite[:group_id])
    if user = User.find_by_email(invite[:email])
      if existing_member = self.find(user.id)
      else
        UserMailer.new_group(user, current_user, group).deliver 
      end
    else
      user = User.invite!({:email => invite[:email]}, current_user)
    end
    create(:group => group, :user => user)
  end
  
  
end
