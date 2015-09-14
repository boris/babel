class FixReadToBook < ActiveRecord::Migration
  def up
    remove_column :books, :read
  end
end
