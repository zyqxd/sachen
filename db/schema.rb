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

ActiveRecord::Schema.define(version: 2019_07_08_230921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "line_one", null: false
    t.string "line_two"
    t.string "postal_code"
    t.string "city", null: false
    t.string "subdivision", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "phone"
    t.string "contact"
    t.string "shipping_courier"
    t.string "shipping_account_number"
    t.bigint "shipping_address_id"
    t.bigint "shipping_address_chinese_id"
    t.bigint "billing_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_address_id"], name: "index_partners_on_billing_address_id"
    t.index ["shipping_address_chinese_id"], name: "index_partners_on_shipping_address_chinese_id"
    t.index ["shipping_address_id"], name: "index_partners_on_shipping_address_id"
  end

  create_table "prices", force: :cascade do |t|
    t.date "effective_from", null: false
    t.decimal "price", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["effective_from", "product_id"], name: "index_prices_on_effective_from_and_product_id", unique: true
    t.index ["product_id"], name: "index_prices_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "category", null: false
    t.string "code", null: false
    t.string "description"
    t.string "name", null: false
    t.string "pr_customer_field"
    t.integer "reorder_threshold", default: 0, null: false
    t.decimal "tax_percent"
    t.boolean "taxable", default: false
    t.boolean "track_inventory", default: true
    t.string "unit", default: "pcs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "partners", "addresses", column: "billing_address_id"
  add_foreign_key "partners", "addresses", column: "shipping_address_chinese_id"
  add_foreign_key "partners", "addresses", column: "shipping_address_id"
  add_foreign_key "prices", "products"
end
