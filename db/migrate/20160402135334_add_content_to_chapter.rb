class AddContentToChapter < ActiveRecord::Migration
  def change
    add_column :chapters, :name, :string
    add_column :chapters, :content, :text
  end
end
