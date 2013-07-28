class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title, null: false
      t.text :description
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
