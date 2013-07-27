class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
