class CreateMessagePhoneConnections < ActiveRecord::Migration
  def change
    create_table :message_phone_connections do |t|
      t.references :message
      t.references :phone
      t.string :type

      t.timestamps
    end
    add_index :message_phone_connections, :message_id
    add_index :message_phone_connections, :phone_id
  end
end
