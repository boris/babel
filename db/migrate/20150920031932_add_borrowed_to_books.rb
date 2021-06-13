class AddBorrowedToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :borrowed_to, :text
  end
end
