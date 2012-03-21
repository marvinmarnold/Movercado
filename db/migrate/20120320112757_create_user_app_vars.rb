class CreateUserAppVars < ActiveRecord::Migration
  def change
    create_table :user_app_vars do |t|
      t.string :role
      t.integer :times_interacted
      t.integer :validated_times_interacted
      t.references :user
      t.references :app

      t.timestamps
    end
    add_index :user_app_vars, :user_id
    add_index :user_app_vars, :app_id
  end
end
