class DashboardsController < ApplicationController

  before_filter :authenticate_user!

  def dashboard
    @groups = current_user.groups
    @notifications = current_user.notifications.where(:active => true ) 
    @show_dashboard = true
  end
  
  def test_group
  end
  
  def admin
    @users = User.all
    authorize! :admin, @users
  end
  
end
