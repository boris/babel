class AddReadToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :read, :boolean
  end
end
