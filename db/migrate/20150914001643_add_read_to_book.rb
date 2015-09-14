class AddReadToBook < ActiveRecord::Migration
  def change
    add_column :books, :read, :boolean
  end
end
