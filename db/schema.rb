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

ActiveRecord::Schema.define(version: 20140312011808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinics", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "doctor",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vendorid",   limit: 255
    t.string   "address",    limit: 255
    t.string   "vsid",       limit: 255
    t.string   "vsvendorid", limit: 255
    t.integer  "model_id"
    t.boolean  "admin"
    t.string   "province",   limit: 255
    t.string   "email",      limit: 255
  end

  create_table "config_settings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distributions", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "content",       limit: 255
    t.string   "feedback_type", limit: 255
    t.string   "email",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "browser",       limit: 255
  end

  create_table "fees", force: :cascade do |t|
    t.decimal  "from"
    t.decimal  "to"
    t.decimal  "fee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "model_id"
  end

  create_table "membership_fees", force: :cascade do |t|
    t.decimal  "receipts"
    t.decimal  "creditcard"
    t.decimal  "refunds"
    t.decimal  "tax"
    t.string   "month",         limit: 255
    t.integer  "checknumber"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clinic_id"
    t.integer  "year"
    t.decimal  "fee"
    t.decimal  "taxadd"
    t.string   "record_status", limit: 255, default: "active", null: false
  end

  create_table "securities", force: :cascade do |t|
    t.string   "secret",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",       limit: 255
  end

  create_table "taxes", force: :cascade do |t|
    t.string   "province",   limit: 255
    t.decimal  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
    t.decimal  "prate"
  end

end
