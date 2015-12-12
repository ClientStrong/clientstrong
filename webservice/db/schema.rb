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

ActiveRecord::Schema.define(version: 20151130002507) do

  create_table "exercises", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.integer "author"
    t.integer "intensity"
  end

  create_table "members", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "mobile"
    t.date     "birthday"
    t.string   "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members_roles", id: false, force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "role_id",   null: false
  end

  add_index "members_roles", ["member_id", "role_id"], name: "index_members_roles_on_member_id_and_role_id"
  add_index "members_roles", ["role_id", "member_id"], name: "index_members_roles_on_role_id_and_member_id"

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

end
