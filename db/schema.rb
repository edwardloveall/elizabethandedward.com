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

ActiveRecord::Schema.define(version: 20140727210857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "attending"
    t.integer  "meal"
    t.boolean  "friday"
    t.integer  "person_id"
  end

  add_index "choices", ["person_id"], name: "index_choices_on_person_id", using: :btree

  create_table "invites", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "token"
    t.boolean  "allow_plus_one", default: false
    t.datetime "plus_one_at"
  end

  create_table "people", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "invite_id"
    t.boolean  "plus_one",   default: false
  end

  add_index "people", ["invite_id"], name: "index_people_on_invite_id", using: :btree

end
