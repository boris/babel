class AddIsbnToBooksAsString < ActiveRecord::Migration[5.0]
  def change
      add_column :books, :isbn, :text
  end
end
