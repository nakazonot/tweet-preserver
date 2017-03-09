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

ActiveRecord::Schema.define(version: 20170308034504) do

  create_table "tweets", force: :cascade do |t|
    t.string   "query"
    t.integer  "no",                     limit: 8, null: false
    t.integer  "retweet_count"
    t.string   "text"
    t.integer  "user_no",                limit: 8, null: false
    t.string   "user_name"
    t.string   "user_profile_image_url"
    t.string   "user_screen_name"
    t.string   "user_location"
    t.string   "user_description"
    t.string   "user_url"
    t.integer  "user_followers_count"
    t.integer  "user_friends_count"
    t.integer  "user_listed_count"
    t.boolean  "user_protected"
    t.datetime "user_created_at"
    t.integer  "user_favourites_count"
    t.integer  "user_statuses_count"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
