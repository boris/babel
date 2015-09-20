class AddBorrowedToBooks < ActiveRecord::Migration
  def change
    add_column :books, :borrowed_to, :text
  end
end
