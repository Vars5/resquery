class AddActionToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :question, :string
  end
end
