class CreateStockTransactions < ActiveRecord::Migration
  def change
    create_table :stock_transactions do |t|
      t.string :warehouse
      t.float :quantity
      t.integer :product
      t.datetime :time
      t.boolean :is_entry
      t.integer :special
      
      t.timestamps
    end
  end
end
