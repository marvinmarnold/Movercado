class CreateSalesData < ActiveRecord::Migration
  def change
    create_table :sales_data do |t|
      t.date :week_start
      t.date :week_end
      t.references :user
      t.string :product
      t.boolean :promotion
      t.float :quantity

      t.timestamps
    end
    add_index :sales_data, :user_id
  end
end
