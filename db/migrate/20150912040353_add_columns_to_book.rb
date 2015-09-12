class AddColumnsToBook < ActiveRecord::Migration
  def change
    add_column :books, :country, :string
    add_column :books, :editor, :string
    add_column :books, :year, :string
  end
end
