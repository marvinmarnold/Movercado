class AddStrToAppVars < ActiveRecord::Migration
  def change
    add_column :app_vars, :str_val, :string
  end
end
