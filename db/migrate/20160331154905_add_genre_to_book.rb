class AddGenreToBook < ActiveRecord::Migration
  def change
    add_column :books, :genre, :string
  end
end
