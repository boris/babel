class CreateAuthorBooks < ActiveRecord::Migration
  def change
    create_table :author_books do |t|

      t.timestamps null: false
    end
  end
end
