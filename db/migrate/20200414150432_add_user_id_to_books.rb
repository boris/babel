class AddUserIdToBooks < ActiveRecord::Migration[5.0]
  def change
      add_column :books, :user_id, :int
      add_index :books, :user_id
  end
end
