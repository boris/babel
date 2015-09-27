class RemoveCharFromCountries < ActiveRecord::Migration
  def change
    remove_column :countries, "char(2)", :string
  end
end
