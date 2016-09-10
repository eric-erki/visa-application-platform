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

ActiveRecord::Schema.define(version: 20160908125207) do

  create_table "applicants", force: :cascade do |t|
    t.string   "name"
    t.string   "passport_number"
    t.string   "phone_number"
    t.string   "mail_address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "corporates", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "user_name"
    t.string   "password"
    t.text     "domain"
    t.integer  "corporate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "applicant_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "status_code"
    t.text     "note"
    t.integer  "visa_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "visas", force: :cascade do |t|
    t.string   "country_abbr"
    t.integer  "visa_type"
    t.text     "note"
    t.boolean  "archived"
    t.integer  "applicant_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
