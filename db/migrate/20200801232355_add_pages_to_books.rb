class AddPagesToBooks < ActiveRecord::Migration[5.0]
  def change
      add_column :books, :pages, :int
  end
end
