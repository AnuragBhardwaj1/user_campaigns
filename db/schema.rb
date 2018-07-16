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

ActiveRecord::Schema.define(version: 20180716061242) do

  create_table "campaigns", force: :cascade do |t|
    t.string   "title"
    t.string   "tag"
    t.string   "duration"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "todos", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "todos", ["campaign_id"], name: "index_todos_on_campaign_id"
  add_index "todos", ["user_id"], name: "index_todos_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest", limit: 40
    t.integer  "role",                       default: 0, null: false
    t.integer  "status",                     default: 0, null: false
    t.string   "profession"
    t.string   "service"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["role"], name: "index_users_on_role"
  add_index "users", ["status"], name: "index_users_on_status"

end
