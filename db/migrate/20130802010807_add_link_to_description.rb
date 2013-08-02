class AddLinkToDescription < ActiveRecord::Migration
  def change
    add_column :discussions, :link, :string
  end
end
