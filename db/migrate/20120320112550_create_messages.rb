class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.datetime :time
      t.string :raw_message
      t.references :app
      t.references :sender
      t.references :recipient

      t.timestamps
    end
    add_index :messages, :app_id
    add_index :messages, :sender_id
    add_index :messages, :recipient_id
  end
end
