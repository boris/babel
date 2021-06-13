class SetDefaultPagesAndMaxStars < ActiveRecord::Migration[6.0]
  def change
      change_column :books, :pages, :int, :default => 0
      Book.update_all(:pages => 0)
  end
end
