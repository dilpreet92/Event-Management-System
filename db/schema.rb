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

ActiveRecord::Schema.define(version: 20140930161801) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_time"
    t.time     "end_time"
    t.text     "address"
    t.string   "city"
    t.string   "country"
    t.integer  "contact_details"
    t.text     "description"
    t.boolean  "status",          default: true
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "sessions", force: true do |t|
    t.string   "topic"
    t.date     "start_date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "location"
    t.string   "description"
    t.string   "speaker"
    t.boolean  "status"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["event_id"], name: "index_sessions_on_event_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "access_token"
    t.string   "twitter_secret"
    t.integer  "uid"
    t.boolean  "is_admin",        default: false
  end

end
