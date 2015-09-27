class RemoveColumnsFromAuthors < ActiveRecord::Migration
  def change
    remove_column :authors, :countries_id, :string
  end
end
