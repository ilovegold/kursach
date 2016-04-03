class AddIndexToComment < ActiveRecord::Migration
  def change
    add_column :comments, :book_id, :integer
  end
end
