class RemoveColumnsFromBooks < ActiveRecord::Migration
  def self.up
    remove_column :books, :author
    remove_column :books, :created_at
    remove_column :books, :updated_at
    remove_column :books, :country
    remove_column :books, :editor
    remove_column :books, :borrowed
    remove_column :books, :borrowed_to
  end

  def self.down
    add_column :books, :language
    add_column :books, :author_id
    add_column :book, :editor_id
    add_column :books, :borrow_id
  end
end
