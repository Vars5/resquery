class DashboardsController < ApplicationController

  before_filter :authenticate_user!

  def dashboard
  end
  
  def test_group
  end
  
end
