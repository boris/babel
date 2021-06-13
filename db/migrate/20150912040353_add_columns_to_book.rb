class AddColumnsToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :country, :string
    add_column :books, :editor, :string
    add_column :books, :year, :string
  end
end
