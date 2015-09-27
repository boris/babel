class AddForeignKeysToAll < ActiveRecord::Migration
  def change
    add_column :authors, :country_id, :integer
    add_column :editors, :country_id, :integer
  end
end
