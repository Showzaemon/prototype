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

ActiveRecord::Schema.define(version: 20141024134602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "firms", force: true do |t|
    t.string   "name"
    t.integer  "step",       limit: 8
    t.integer  "stock",      limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "firms", ["name"], name: "index_firms_on_name", unique: true, using: :btree

  create_table "request_objects", force: true do |t|
    t.integer  "cycle",       limit: 8
    t.string   "class_name"
    t.integer  "instance_id", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_objects", ["cycle"], name: "index_request_objects_on_cycle", using: :btree

end
