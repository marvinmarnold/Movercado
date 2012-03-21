class CreateActorCodes < ActiveRecord::Migration
  def change
    create_table :actor_codes do |t|
      t.string :code
      t.integer :times_used, :default => 0
      t.references :user
      t.references :app

      t.timestamps
    end
    add_index :actor_codes, :user_id
    add_index :actor_codes, :app_id
  end
end
