class AddBooksRating < ActiveRecord::Migration[5.0]
  def change
      add_column :books, :rating, :int
  end
end
