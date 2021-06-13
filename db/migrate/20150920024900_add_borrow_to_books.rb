class AddBorrowToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :borrowed, :boolean, :null => false, default: '0'
  end
end
