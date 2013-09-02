class AddGroupIdToArticle < ActiveRecord::Migration
  def change
      add_column :articles, :group_id, :integer
      add_column :articles, :user_id,  :integer
      add_column :articles, :topic_id,  :integer
  end
end
