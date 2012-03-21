class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.text :description
      t.string :app_code
      t.string :type

      t.timestamps
    end
  end
end
