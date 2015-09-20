class AddBorrowToBooks < ActiveRecord::Migration
  def change
    add_column :books, :borrowed, :boolean, :null => false, default: '0'
  end
end
