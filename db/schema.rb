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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161206000322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "twitter_data", force: :cascade do |t|
    t.string   "screen_name"
    t.datetime "created_at",      null: false
    t.integer  "followers_count"
    t.integer  "statuses_count"
    t.string   "id_str"
    t.text     "last_status"
    t.integer  "user_id"
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_twitter_data_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "category"
    t.string   "kind"
    t.text     "summary"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "age"
    t.string   "gender"
  end

  add_foreign_key "twitter_data", "users"
end
