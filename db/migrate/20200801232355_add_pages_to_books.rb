class AddPagesToBooks < ActiveRecord::Migration[6.0]
  def change
      add_column :books, :pages, :int
  end
end
