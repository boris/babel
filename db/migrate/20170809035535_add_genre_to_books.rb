class AddGenreToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :genre, :string
  end
end
