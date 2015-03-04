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

ActiveRecord::Schema.define(version: 20150304164748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "identification"
    t.string   "phone"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "identification"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.boolean  "active",         default: true
    t.string   "email"
  end

  create_table "invoice_details", force: :cascade do |t|
    t.integer  "quantity"
    t.decimal  "price",      precision: 10, scale: 2
    t.integer  "points"
    t.integer  "product_id"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "client_id"
    t.decimal  "total",        precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_points"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "barcode"
    t.decimal  "price",       precision: 10, scale: 2
    t.integer  "points"
    t.integer  "stock"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                               default: true
  end

  create_table "trashed_records", force: :cascade do |t|
    t.string   "record_type"
    t.integer  "record_id"
    t.string   "record_content"
    t.string   "record_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
