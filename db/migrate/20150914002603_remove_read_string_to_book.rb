class RemoveReadStringToBook < ActiveRecord::Migration
  def change
    remove_column :books, :read, :boolean
  end
end
