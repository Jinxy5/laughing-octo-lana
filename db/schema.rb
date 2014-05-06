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

ActiveRecord::Schema.define(version: 20140506200328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allowed_roles", force: true do |t|
    t.integer  "forum_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "causes", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image_path"
    t.integer  "amount_requested"
    t.integer  "amount_donated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discourse_replies", force: true do |t|
    t.integer  "discourse_id"
    t.integer  "reply_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discourses", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "body"
    t.boolean  "deleted"
    t.datetime "delete_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_id"
    t.integer  "deapth"
    t.string   "type"
    t.string   "discourse_type"
    t.string   "retort_type"
    t.string   "reply_type"
    t.integer  "views"
  end

  create_table "discussions", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views"
    t.string   "author_name"
    t.integer  "reply_count"
    t.integer  "follower_count"
    t.integer  "view_count"
    t.integer  "last_reply_id"
  end

  create_table "events", force: true do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.string   "title"
    t.text     "content"
    t.string   "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followers", force: true do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "forums", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "author_name"
    t.integer  "discussion_count"
    t.integer  "replies_count"
    t.integer  "reply_count"
    t.integer  "last_reply_id"
    t.integer  "last_discussion_id"
  end

  create_table "images", force: true do |t|
    t.integer  "user_id"
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressions", force: true do |t|
    t.string   "ip_address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discussion_id"
  end

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discussion_id"
    t.integer  "replied_post_id"
    t.boolean  "deleted"
    t.datetime "delete_date"
  end

  create_table "posts_sub_replies", force: true do |t|
    t.integer "post_id"
    t.integer "sub_reply_id"
  end

  create_table "recitals", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replies", force: true do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.boolean  "deleted"
    t.text     "description"
    t.integer  "views"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author_name"
  end

  create_table "reply_retorts", force: true do |t|
    t.integer  "reply_id"
    t.integer  "retort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discourse_id"
  end

  create_table "roles", force: true do |t|
    t.string "role"
  end

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "stories", force: true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "state"
    t.datetime "approve_date"
  end

  create_table "user_roles", force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "register_key"
    t.boolean  "culminated"
    t.string   "remember_token"
    t.datetime "register_token_created_at"
    t.integer  "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nearest_town"
    t.datetime "accepted_at"
    t.datetime "revoked_at"
    t.string   "landline"
    t.string   "mobile"
    t.string   "public_email"
    t.string   "postcode"
    t.string   "address"
    t.boolean  "dud"
    t.datetime "hard_deleted_at"
    t.datetime "soft_deleted_at"
    t.string   "state"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
