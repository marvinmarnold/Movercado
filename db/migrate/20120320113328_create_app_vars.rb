class CreateAppVars < ActiveRecord::Migration
  def change
    create_table :app_vars do |t|
      t.string :name
      t.references :app
      t.integer :count

      t.timestamps
    end
    add_index :app_vars, :app_id
  end
end
