# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120321131727) do

  create_table "actor_codes", :force => true do |t|
    t.string   "code"
    t.integer  "times_used", :default => 0
    t.integer  "user_id"
    t.integer  "app_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "actor_codes", ["app_id"], :name => "index_actor_codes_on_app_id"
  add_index "actor_codes", ["user_id"], :name => "index_actor_codes_on_user_id"

  create_table "app_vars", :force => true do |t|
    t.string   "name"
    t.integer  "app_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "app_vars", ["app_id"], :name => "index_app_vars_on_app_id"

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "app_code"
    t.string   "type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "message_phone_connections", :force => true do |t|
    t.integer  "message_id"
    t.integer  "phone_id"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "message_phone_connections", ["message_id"], :name => "index_message_phone_connections_on_message_id"
  add_index "message_phone_connections", ["phone_id"], :name => "index_message_phone_connections_on_phone_id"

  create_table "message_tag_connections", :force => true do |t|
    t.integer  "message_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "message_tag_connections", ["message_id"], :name => "index_message_tag_connections_on_message_id"
  add_index "message_tag_connections", ["tag_id"], :name => "index_message_tag_connections_on_tag_id"

  create_table "messages", :force => true do |t|
    t.datetime "time"
    t.string   "raw_message"
    t.integer  "app_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "messages", ["app_id"], :name => "index_messages_on_app_id"
  add_index "messages", ["recipient_id"], :name => "index_messages_on_recipient_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.string   "carrier"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "phones", ["user_id"], :name => "index_phones_on_user_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_app_vars", :force => true do |t|
    t.string   "role"
    t.integer  "times_interacted"
    t.integer  "validated_times_interacted"
    t.integer  "user_id"
    t.integer  "app_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "user_app_vars", ["app_id"], :name => "index_user_app_vars_on_app_id"
  add_index "user_app_vars", ["user_id"], :name => "index_user_app_vars_on_user_id"

  create_table "users", :force => true do |t|
    t.date     "birthday"
    t.string   "gender"
    t.integer  "num_actor_codes_generated", :default => 0
    t.integer  "num_children"
    t.string   "marital_status"
    t.string   "nickname"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

end
