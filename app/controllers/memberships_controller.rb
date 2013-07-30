class MembershipsController < ApplicationController

  def create
    @membership = Membership.create_or_invite(params[:invite], current_user)
    redirect_to @membership.group
  end

end
