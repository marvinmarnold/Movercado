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

ActiveRecord::Schema.define(:version => 20120327153124) do

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
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "str_val"
  end

  add_index "app_vars", ["app_id"], :name => "index_app_vars_on_app_id"

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "app_code"
    t.string   "type"
    t.string   "key"
    t.string   "token"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "mc_data", :force => true do |t|
    t.float    "init_vital_ta_num"
    t.float    "init_vital_ta_denom"
    t.float    "init_vital_fr"
    t.float    "init_vital_fc"
    t.float    "init_vital_temp"
    t.float    "init_vital_peso"
    t.float    "init_anest"
    t.boolean  "init_anormalidade"
    t.text     "init_anormalidade_exp"
    t.boolean  "can_cm"
    t.string   "consent_name"
    t.date     "consent_date_signe"
    t.date     "consent_date_guardian_signed"
    t.string   "consent_nome_us"
    t.string   "notas_profissional"
    t.date     "notas_date"
    t.string   "notas_assistente"
    t.datetime "notas_start"
    t.datetime "notas_end"
    t.string   "notas_tipo"
    t.float    "notas_anesteica"
    t.float    "notas_lidocaina"
    t.boolean  "notas_paracetamol"
    t.boolean  "notas_medicacao"
    t.string   "notas_medicacao_exp"
    t.float    "notas_sinas_ta_num"
    t.float    "notas_sinas_ta_denom"
    t.float    "notas_sinais_fc"
    t.float    "notas_sinais_fr"
    t.float    "notas_sinais_temp"
    t.boolean  "notas_complicacoes"
    t.boolean  "notas_resultado"
    t.text     "notas_comentarios"
    t.string   "pos_profissional"
    t.date     "pos_data"
    t.text     "pos_estado"
    t.boolean  "pos_complicaoes"
    t.text     "pos_comentarios"
    t.string   "pos2_profissional"
    t.date     "pos2_data"
    t.text     "pos2_estada"
    t.boolean  "pos2_complicacoes"
    t.text     "pos2_comentarios"
    t.string   "registo_us"
    t.string   "registo_utente_first"
    t.string   "registo_utente_last"
    t.string   "registo_address"
    t.string   "registo_phone_string"
    t.date     "registo_data"
    t.string   "registo_nid"
    t.integer  "registo_anos"
    t.string   "registo_estado"
    t.string   "registo_referenciado"
    t.string   "registo_motivo"
    t.boolean  "registo_testagem_aconselhado"
    t.boolean  "regito_testado"
    t.string   "registo_resultado"
    t.boolean  "registo_its"
    t.string   "registo_tratemento"
    t.boolean  "registo_operacao"
    t.text     "registo_operacao_exp"
    t.boolean  "registo_med"
    t.text     "registo_med_exp"
    t.boolean  "registo_aler"
    t.text     "registo_aler_exp"
    t.string   "registo_manifestacao"
    t.string   "registo_referenciado_outro"
    t.string   "registo_motivo_outro"
    t.string   "registo_tratemento_outro"
    t.string   "registo_manifestacao_exp"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
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

  create_table "sales_data", :force => true do |t|
    t.date     "week_start"
    t.date     "week_end"
    t.integer  "user_id"
    t.string   "product"
    t.boolean  "promotion"
    t.float    "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sales_data", ["user_id"], :name => "index_sales_data_on_user_id"

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
