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

ActiveRecord::Schema.define(version: 20140503000000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brand_models", force: true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brand_models", ["name", "brand_id"], name: "index_brand_models_on_name_and_brand_id", unique: true, using: :btree

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["name"], name: "index_brands_on_name", unique: true, using: :btree

  create_table "car_parts", force: true do |t|
    t.integer  "car_id"
    t.text     "description"
    t.string   "ebay_article_number"
    t.integer  "ebay_selling_type"
    t.date     "ebay_online_since"
    t.integer  "ebay_state"
    t.decimal  "price"
    t.decimal  "postage_germany"
    t.decimal  "postage_austria"
    t.decimal  "postage_swiss"
    t.decimal  "postage_europe_with_eu"
    t.decimal  "postage_europe_without_eu"
    t.decimal  "postage_world_wide"
    t.string   "picture_url1"
    t.string   "picture_url2"
    t.string   "picture_url3"
    t.string   "picture_url4"
    t.string   "picture_url5"
    t.string   "picture_url6"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "car_parts", ["car_id"], name: "index_car_parts_on_car_id", using: :btree
  add_index "car_parts", ["ebay_article_number"], name: "index_car_parts_on_ebay_article_number", unique: true, using: :btree

  create_table "cars", force: true do |t|
    t.string   "car_identifier"
    t.integer  "brand_model_id"
    t.string   "car_type"
    t.integer  "power"
    t.integer  "month_of_construction"
    t.integer  "year_of_construction"
    t.integer  "month_of_construction_period_from"
    t.integer  "year_of_construction_period_from"
    t.integer  "month_of_construction_period_to"
    t.integer  "year_of_construction_period_to"
    t.integer  "cylinder_capacity"
    t.integer  "fuel"
    t.integer  "gearing"
    t.string   "key_number2"
    t.string   "key_number3"
    t.integer  "mileage"
    t.integer  "seller_id"
    t.string   "picture_url"
    t.string   "ebay_url_all_parts"
    t.string   "name_ebay_url_all_parts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cars", ["brand_model_id"], name: "index_cars_on_brand_model_id", using: :btree
  add_index "cars", ["car_identifier"], name: "index_cars_on_car_identifier", unique: true, using: :btree

  create_table "sellers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "city"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
