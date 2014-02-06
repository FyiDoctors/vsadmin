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

ActiveRecord::Schema.define(version: 20140206200145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinics", force: true do |t|
    t.string   "name"
    t.string   "doctor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vendorid"
    t.string   "address"
    t.string   "vsid"
    t.string   "vsvendorid"
    t.integer  "model_id"
    t.boolean  "admin"
    t.string   "province"
  end

  create_table "fees", force: true do |t|
    t.decimal  "from"
    t.decimal  "to"
    t.decimal  "fee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "model_id"
  end

  create_table "membership_fees", force: true do |t|
    t.decimal  "receipts"
    t.decimal  "creditcard"
    t.decimal  "refunds"
    t.decimal  "tax"
    t.string   "month"
    t.integer  "checknumber"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clinic_id"
    t.integer  "year"
    t.decimal  "fee"
    t.decimal  "taxadd"
  end

  create_table "memebership_fees", force: true do |t|
    t.decimal  "receipts"
    t.decimal  "creditcard"
    t.decimal  "refunds"
    t.decimal  "tax"
    t.string   "month"
    t.integer  "checknumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "securities", force: true do |t|
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "taxes", force: true do |t|
    t.string   "province"
    t.decimal  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.decimal  "prate"
  end

end
