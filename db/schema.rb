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

ActiveRecord::Schema.define(:version => 20101218110635) do

  create_table "announcements", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.string   "place"
    t.string   "place_long"
    t.integer  "community_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "target_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.text     "activity"
    t.string   "direction"
    t.string   "description"
    t.string   "slogan"
    t.boolean  "is_approved"
    t.boolean  "is_blocked"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "creator_user_id"
  end

  create_table "community_users", :force => true do |t|
    t.integer  "community_id"
    t.integer  "user_id"
    t.boolean  "is_approved"
    t.boolean  "is_communityadmin"
    t.boolean  "is_communitymember"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "date"
    t.string   "place"
    t.string   "place_long"
    t.string   "place_latt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "community_id"
    t.integer  "user_id"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "community_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_profiles", :force => true do |t|
    t.string   "nickname"
    t.text     "description"
    t.datetime "birthdate"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_communityadmin"
    t.boolean  "is_superadmin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
