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

ActiveRecord::Schema.define(version: 20170306211759) do

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_field_values", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "custom_field_id"
    t.string   "value"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "custom_field_values", ["contact_id"], name: "index_custom_field_values_on_contact_id"
  add_index "custom_field_values", ["custom_field_id"], name: "index_custom_field_values_on_custom_field_id"

  create_table "custom_fields", force: :cascade do |t|
    t.integer  "custom_field_type"
    t.string   "name"
    t.text     "description"
    t.text     "default"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
