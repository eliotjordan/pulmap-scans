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

ActiveRecord::Schema.define(version: 20150630155641) do

  create_table "images", force: :cascade do |t|
    t.text     "ark"
    t.integer  "bibid"
    t.string   "title"
    t.text     "publisher"
    t.text     "author"
    t.text     "description"
    t.text     "pub_info"
    t.integer  "year"
    t.text     "bbox_source"
    t.text     "bbox"
    t.text     "ingested"
    t.text     "georefed"
    t.text     "image_status"
    t.boolean  "copyright"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "images", ["ark"], name: "index_images_on_ark", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "role",       default: "guest"
  end

end
