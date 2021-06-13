class FixReadToBook < ActiveRecord::Migration[6.0]
  def up
    remove_column :books, :read
  end
end
