class AddLargeSlidesToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :large_slides,  :text
  end
end
