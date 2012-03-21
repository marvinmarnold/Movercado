class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.string :carrier
      t.references :user

      t.timestamps
    end
    add_index :phones, :user_id
  end
end
