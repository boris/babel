class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
      t.string :borrowed
      t.string :borrowed_to
      t.datetime :returned
      t.datetime :returned_date

      t.timestamps null: false
    end
  end
end
