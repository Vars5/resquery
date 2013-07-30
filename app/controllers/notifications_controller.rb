class NotificationsController < ApplicationController
  
  def deactivate
    @notification = Notification.find(params[:id])
    @notification.update_attributes(:active => false)
    redirect_to root_path
  end
  
end