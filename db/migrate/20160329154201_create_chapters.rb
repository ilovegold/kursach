class CreateChapters < ActiveRecord::Migration
  def up
  	drop_table :chapters
    create_table :chapters do |t|
    	t.belongs_to :book, index: true
    end
  end
end