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

ActiveRecord::Schema.define(version: 20151012230919) do

  create_table "author_books", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "author",      limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "country",     limit: 255
    t.string   "editor",      limit: 255
    t.string   "year",        limit: 255
    t.boolean  "read"
    t.boolean  "borrowed",                  default: false, null: false
    t.text     "borrowed_to", limit: 65535
  end

  create_table "borrows", force: :cascade do |t|
    t.boolean  "borrowed"
    t.string   "borrowed_to",   limit: 255
    t.datetime "date"
    t.boolean  "returned"
    t.datetime "returned_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string  "iso",            limit: 255
    t.string  "name",           limit: 255
    t.string  "printable_name", limit: 255
    t.string  "iso3",           limit: 255
    t.integer "numcode",        limit: 4
  end

  create_table "editors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "country_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
