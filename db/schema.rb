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

ActiveRecord::Schema.define(version: 20180220060614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "style_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "photo_processing"
  end

  add_index "attachments", ["style_id"], name: "index_attachments_on_style_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       default: "Category Name Needed", null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "stripe_customer_id"
    t.integer  "plan_id"
    t.integer  "status"
    t.boolean  "trial_period_active"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "coupon"
  end

  add_index "payment_accounts", ["user_id"], name: "index_payment_accounts_on_user_id", using: :btree

  create_table "pointless_feedback_messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email_address"
    t.string   "topic"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_sets", force: :cascade do |t|
    t.string   "name",       null: false
    t.date     "scout_date"
    t.string   "vendor"
    t.string   "location"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "profile_configs", force: :cascade do |t|
    t.boolean  "default_home_my_product_sets", default: false
    t.integer  "user_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "coupon"
  end

  create_table "styles", force: :cascade do |t|
    t.string   "vendor_style_number",                                            null: false
    t.integer  "product_set_id"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.text     "notes"
    t.decimal  "negotiated_cost",       precision: 10, scale: 2
    t.decimal  "retail_price",          precision: 10, scale: 2
    t.decimal  "wholesale_cost",        precision: 10, scale: 2
    t.string   "category_name"
    t.date     "delivery_date"
    t.integer  "quantity",                                       default: 0,     null: false
    t.integer  "status",                                         default: 0
    t.string   "color"
    t.integer  "default_attachment_id"
    t.boolean  "exclusive",                                      default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "role"
    t.boolean  "administrator",          default: false
    t.integer  "company_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "variations", force: :cascade do |t|
    t.string "size"
  end

  add_foreign_key "attachments", "styles"
  add_foreign_key "payment_accounts", "users"
end
