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

ActiveRecord::Schema.define(version: 20171121140257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "product_size_chart_details", force: :cascade do |t|
    t.integer  "product_size_chart_id"
    t.string   "size_detail_name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "product_size_charts", force: :cascade do |t|
    t.string   "product_name"
    t.string   "product_sku"
    t.text     "product_sizes_ids"
    t.float    "no_of_rows"
    t.string   "shop_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "product_size_details", force: :cascade do |t|
    t.integer  "product_size_id"
    t.integer  "product_size_chart_detail_id"
    t.float    "size_value",                   default: 0.0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "product_sizes", force: :cascade do |t|
    t.string   "product_size_name"
    t.string   "shop_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", null: false
    t.string   "shopify_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true, using: :btree
  end

end
