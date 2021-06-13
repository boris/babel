class AddBooksRating < ActiveRecord::Migration[6.0]
  def change
      add_column :books, :rating, :int
  end
end
