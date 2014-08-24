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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140824213024) do

  create_table "calls", force: true do |t|
    t.datetime "call_time"
    t.string   "number"
    t.string   "label"
    t.string   "from_city"
    t.string   "from_state"
    t.decimal  "minutes",    precision: 10, scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "downloads", force: true do |t|
    t.datetime "downloaded_at"
    t.string   "ip_address"
    t.string   "username"
    t.text     "filename"
    t.integer  "filesize"
    t.string   "internal_ip"
    t.string   "internal_port"
    t.string   "city"
    t.string   "region_code"
    t.string   "country_code"
    t.string   "country_name"
    t.string   "file_extension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "downloads", ["city"], name: "index_downloads_on_city", using: :btree
  add_index "downloads", ["country_name", "city"], name: "index_downloads_on_country_name_and_city", using: :btree
  add_index "downloads", ["country_name"], name: "index_downloads_on_country_name", using: :btree
  add_index "downloads", ["ip_address", "country_name"], name: "index_downloads_on_ip_address_and_country_name", using: :btree
  add_index "downloads", ["ip_address"], name: "index_downloads_on_ip_address", using: :btree

  create_table "keywords", force: true do |t|
    t.integer  "age"
    t.string   "sex"
    t.string   "user_category"
    t.integer  "download_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "word"
    t.string   "country_name"
  end

  add_index "keywords", ["country_name"], name: "index_keywords_on_country_name", using: :btree
  add_index "keywords", ["download_id"], name: "index_keywords_on_download_id", using: :btree
  add_index "keywords", ["word"], name: "index_keywords_on_word", using: :btree

  create_table "uploads", force: true do |t|
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
  end

end
