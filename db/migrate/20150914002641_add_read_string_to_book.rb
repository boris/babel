class AddReadStringToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :read, :string
  end
end
