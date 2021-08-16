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

ActiveRecord::Schema.define(version: 2021_08_14_061155) do

  create_table "addresses", force: :cascade do |t|
    t.integer "custmer_id", null: false
    t.string "name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "custmer_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "tax_price", null: false
    t.integer "amount", null: false
    t.integer "production_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "custmer_id", null: false
    t.string "delivary_postal_code", null: false
    t.string "delivary_address", null: false
    t.string "delivary_name", null: false
    t.integer "delivary_fee", null: false
    t.integer "total_payment", null: false
    t.integer "order_status", null: false
    t.integer "payment_method", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.string "image_id", null: false
    t.integer "price", null: false
    t.integer "sales_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
