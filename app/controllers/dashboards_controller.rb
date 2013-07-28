class DashboardsController < ApplicationController

  before_filter :authenticate_user!

  def dashboard
    @groups = current_user.groups.all
  end
  
  def test_group
  end
  
end
