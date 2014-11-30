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

ActiveRecord::Schema.define(version: 20141129221935) do

  create_table "carriers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.integer  "manufacturer_id"
    t.integer  "carrier_id"
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["carrier_id"], name: "index_devices_on_carrier_id"
  add_index "devices", ["manufacturer_id"], name: "index_devices_on_manufacturer_id"

  create_table "line_items", force: true do |t|
    t.integer  "order_id"
    t.string   "product_sku"
    t.string   "product_description"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cart_id"
    t.integer  "product_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id"

  create_table "locations", force: true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["location_id"], name: "index_orders_on_location_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "type_id"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "vendor_id"
  end

  add_index "products", ["device_id"], name: "index_products_on_device_id"
  add_index "products", ["type_id"], name: "index_products_on_type_id"
  add_index "products", ["vendor_id"], name: "index_products_on_vendor_id"

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
    t.decimal  "price"
    t.decimal  "compare_at_price"
    t.string   "sku"
    t.decimal  "weight"
    t.integer  "weight_uom",        limit: 255
    t.string   "barcode"
    t.boolean  "taxable"
    t.boolean  "requires_shipping"
    t.integer  "quantity"
    t.boolean  "inventory_policy"
  end

  add_index "variants", ["product_id"], name: "index_variants_on_product_id"

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
