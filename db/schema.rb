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

ActiveRecord::Schema.define(version: 20150927030017) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "country_id", limit: 4
  end

  create_table "books", force: :cascade do |t|
    t.string  "title",     limit: 255
    t.string  "year",      limit: 255
    t.boolean "read"
    t.string  "language",  limit: 255
    t.integer "author_id", limit: 4
    t.integer "editor_id", limit: 4
    t.integer "borrow_id", limit: 4
  end

  create_table "borrows", force: :cascade do |t|
    t.string   "borrowed",      limit: 255
    t.string   "borrowed_to",   limit: 255
    t.datetime "returned"
    t.datetime "returned_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "code", limit: 2
    t.string "name", limit: 100
  end

  create_table "editors", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "countries_id", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "country_id",   limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
