class MembershipsController < ApplicationController

  def create
    @invite_hash = params[:invite]
    @user = User.find_by_email(@invite_hash[:email])
    @group = Group.find(@invite_hash[:group_id])
    
    if @user.blank?
      User.invite!({:email => @invite_hash[:email]}, current_user)
      @new_user = User.last # Improve this logic
      @invite = @new_user.memberships.build(:group_id => @invite_hash[:group_id])
      
      if @invite.save
        redirect_to @group
      end
    
    else
      @invite = @user.memberships.build(:group_id => @invite_hash[:group_id])
      if @invite.save
        UserMailer.new_group(@user, current_user, @group).deliver
        redirect_to @group
      end
    end
  end

end
