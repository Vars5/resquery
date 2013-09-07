class AddParagraphIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :paragraph_id,  :string
  end
end
