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

ActiveRecord::Schema.define(version: 20160913050121) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "address_type"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
  end

  create_table "pet_breeds", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "breed_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "bio"
    t.boolean  "adoptable"
    t.decimal  "price"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "pet_image_file_name"
    t.string   "pet_image_content_type"
    t.integer  "pet_image_file_size"
    t.datetime "pet_image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
