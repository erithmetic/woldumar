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

ActiveRecord::Schema.define(:version => 20110326202523) do

  create_table "authorize_net_credentials", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "camps", :force => true do |t|
    t.string   "name"
    t.integer  "min_age"
    t.integer  "max_age"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "details"
    t.decimal  "fee"
    t.decimal  "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", :force => true do |t|
    t.string   "in_memory_of"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.decimal  "amount",       :precision => 10, :scale => 2, :default => 0.0
    t.integer  "cc_auth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_registrations", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "cc_auth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "details"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "flier_file_name"
    t.string   "flier_content_type"
    t.integer  "flier_file_size"
    t.datetime "flier_updated_at"
  end

  create_table "occurrences", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.decimal  "price"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "sessions", :force => true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "camp_id"
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.boolean  "is_admin",                            :default => false
    t.boolean  "is_member",                           :default => false
    t.string   "title"
    t.string   "middle_name"
    t.date     "birth_date"
    t.string   "address_line_3"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "work_phone_ext"
    t.string   "mobile_phone"
    t.string   "fax"
    t.text     "notes"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
