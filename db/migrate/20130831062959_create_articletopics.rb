class CreateArticletopics < ActiveRecord::Migration
  def change
    create_table :articletopics do |t|
      t.integer :topic_id
      t.integer :article_id
      t.integer :user_id
      t.boolean :parent

      t.timestamps
    end
  end
end
