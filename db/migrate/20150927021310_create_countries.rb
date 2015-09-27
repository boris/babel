class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, :string
      t.string :iso, "char(2)"

      t.timestamps null: false
    end
  end
end
