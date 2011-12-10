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

ActiveRecord::Schema.define(:version => 20111210110340) do

  create_table "sites", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "url"
    t.string   "time_zone"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["token"], :name => "index_sites_on_token"
  add_index "sites", ["user_id"], :name => "index_sites_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["auth_token"], :name => "index_users_on_auth_token"
  add_index "users", ["email"], :name => "index_users_on_email"

end
