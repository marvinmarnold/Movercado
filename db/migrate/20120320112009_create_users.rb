class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.date :birthday
      t.string :gender
      t.integer :num_actor_codes_generated, :default => 0
      t.integer :num_children
      t.string :marital_status
      t.string :nickname

      t.timestamps
    end
  end
end

