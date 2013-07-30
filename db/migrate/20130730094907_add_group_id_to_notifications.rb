class AddGroupIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :group_id, :integer
  end
end
