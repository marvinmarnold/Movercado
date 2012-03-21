class CreateMessageTagConnections < ActiveRecord::Migration
  def change
    create_table :message_tag_connections do |t|
      t.references :message
      t.references :tag

      t.timestamps
    end
    add_index :message_tag_connections, :message_id
    add_index :message_tag_connections, :tag_id
  end
end
