class AddForeignKeys < ActiveRecord::Migration
  def change
    add_column :books, :author_id, :integer
    add_column :books, :editor_id, :integer
    add_column :books, :borrow_id, :integer
  end
end
