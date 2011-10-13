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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111013073755) do

  create_table "categories", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "manufacturer_id", :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "manufacturer_id", :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "manufacturer_id",                :default => 1, :null => false
    t.integer  "group_id",                       :default => 1, :null => false
    t.integer  "category_id",                    :default => 1, :null => false
    t.string   "product",         :limit => 100,                :null => false
    t.string   "info"
    t.float    "purchase_price"
    t.float    "sales_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
