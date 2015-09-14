class ChangeReadTypeInBook < ActiveRecord::Migration
  def up
    change_column :books, :read, :boolean
  end

  def down
    change_column :books, :read, :string
  end
end
