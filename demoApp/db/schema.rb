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

ActiveRecord::Schema.define(version: 20160814164415) do

  create_table "app_modules", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "label",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "app_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "user_name",              limit: 255, default: "", null: false
    t.string   "first_name",             limit: 255, default: "", null: false
    t.string   "last_name",              limit: 255, default: "", null: false
    t.string   "phone_number",           limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "user_type_id",           limit: 4
    t.integer  "user_category_id",       limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "app_users", ["email"], name: "index_app_users_on_email", unique: true, using: :btree
  add_index "app_users", ["reset_password_token"], name: "index_app_users_on_reset_password_token", unique: true, using: :btree
  add_index "app_users", ["user_category_id"], name: "fk_rails_7e5552bee9", using: :btree
  add_index "app_users", ["user_type_id"], name: "fk_rails_2feb952136", using: :btree

  create_table "user_categories", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.string   "description",  limit: 255
    t.integer  "user_type_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "user_categories", ["user_type_id"], name: "fk_rails_2fe4fd91db", using: :btree

  create_table "user_category_app_modules", force: :cascade do |t|
    t.integer  "user_category_id", limit: 4
    t.integer  "app_module_id",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "user_category_app_modules", ["app_module_id"], name: "fk_rails_c33d4aba41", using: :btree
  add_index "user_category_app_modules", ["user_category_id"], name: "fk_rails_01ad358063", using: :btree

  create_table "user_types", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "app_users", "user_categories"
  add_foreign_key "app_users", "user_types"
  add_foreign_key "user_categories", "user_types", on_delete: :cascade
  add_foreign_key "user_category_app_modules", "app_modules"
  add_foreign_key "user_category_app_modules", "user_categories"
end
