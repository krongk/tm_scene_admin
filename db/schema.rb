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

ActiveRecord::Schema.define(version: 20141017073102) do

  create_table "admin_resources", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "cates", force: true do |t|
    t.string "name"
  end

  add_index "cates", ["name"], name: "index_cates_on_name", unique: true, using: :btree

  create_table "galleries", force: true do |t|
    t.integer "user_id"
    t.string  "name"
  end

  add_index "galleries", ["user_id"], name: "index_galleries_on_user_id", using: :btree

  create_table "keystores", force: true do |t|
    t.string  "obj_type", null: false
    t.integer "obj_id",   null: false
    t.string  "key",      null: false
    t.string  "value"
  end

  add_index "keystores", ["obj_type", "obj_id", "key"], name: "index_keystores_on_obj_type_and_obj_id_and_key", unique: true, using: :btree

  create_table "page_templates", force: true do |t|
    t.string   "title",         null: false
    t.string   "preview_image"
    t.text     "html",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_templates", ["title"], name: "index_page_templates_on_title", unique: true, using: :btree

  create_table "payment_coupons", force: true do |t|
    t.integer  "user_id",         limit: 8,                                            null: false
    t.string   "code",                                                                 null: false
    t.decimal  "price",                     precision: 8, scale: 2
    t.string   "message"
    t.string   "status",                                            default: "active"
    t.integer  "actived_by"
    t.integer  "actived_site_id"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_coupons", ["actived_by"], name: "index_payment_coupons_on_actived_by", using: :btree
  add_index "payment_coupons", ["actived_site_id"], name: "index_payment_coupons_on_actived_site_id", using: :btree
  add_index "payment_coupons", ["code"], name: "index_payment_coupons_on_code", unique: true, using: :btree
  add_index "payment_coupons", ["user_id"], name: "index_payment_coupons_on_user_id", using: :btree

  create_table "payment_tokens", force: true do |t|
    t.integer  "user_id",                            null: false
    t.string   "code",                               null: false
    t.string   "status",          default: "active", null: false
    t.string   "note"
    t.integer  "actived_by"
    t.integer  "actived_site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_tokens", ["actived_by"], name: "index_payment_tokens_on_actived_by", using: :btree
  add_index "payment_tokens", ["actived_site_id"], name: "index_payment_tokens_on_actived_site_id", using: :btree
  add_index "payment_tokens", ["code"], name: "index_payment_tokens_on_code", unique: true, using: :btree
  add_index "payment_tokens", ["user_id"], name: "index_payment_tokens_on_user_id", using: :btree

  create_table "pictures", force: true do |t|
    t.integer  "user_id"
    t.integer  "gallery_id"
    t.string   "name"
    t.string   "key"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["gallery_id"], name: "index_pictures_on_gallery_id", using: :btree
  add_index "pictures", ["user_id"], name: "index_pictures_on_user_id", using: :btree

  create_table "resources", force: true do |t|
    t.integer  "user_id"
    t.string   "typo"
    t.string   "name"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["user_id"], name: "index_resources_on_user_id", using: :btree

  create_table "sections", force: true do |t|
    t.integer  "template_id",                                        null: false
    t.string   "key",                                                null: false
    t.string   "title"
    t.string   "description"
    t.string   "preview_image"
    t.string   "typo",                             default: "image"
    t.boolean  "is_repeat",                        default: false
    t.text     "html",          limit: 2147483647
    t.text     "form"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["key", "template_id"], name: "index_sections_on_key", unique: true, using: :btree
  add_index "sections", ["template_id"], name: "index_sections_on_template_id", using: :btree

  create_table "site_comments", force: true do |t|
    t.integer  "site_id",      null: false
    t.string   "name"
    t.string   "mobile_phone"
    t.string   "tel_phone"
    t.string   "email"
    t.string   "qq"
    t.string   "weixin"
    t.string   "state"
    t.string   "city"
    t.string   "district"
    t.string   "address"
    t.string   "gender"
    t.string   "birth"
    t.string   "hobby"
    t.string   "content"
    t.string   "content2"
    t.string   "content3"
    t.string   "status"
    t.string   "updated_by"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_comments", ["site_id"], name: "index_site_comments_on_site_id", using: :btree

  create_table "site_pages", force: true do |t|
    t.integer  "site_id",     null: false
    t.string   "key"
    t.string   "title"
    t.string   "keywords"
    t.string   "description"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_pages", ["key"], name: "index_site_pages_on_key", unique: true, using: :btree
  add_index "site_pages", ["site_id"], name: "index_site_pages_on_site_id", using: :btree

  create_table "site_sections", force: true do |t|
    t.integer  "site_id",                null: false
    t.integer  "section_id"
    t.integer  "position",   default: 0
    t.text     "html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_sections", ["section_id"], name: "index_site_sections_on_section_id", using: :btree
  add_index "site_sections", ["site_id"], name: "index_site_sections_on_site_id", using: :btree

  create_table "sites", force: true do |t|
    t.integer  "user_id",                                                null: false
    t.integer  "template_id",                                            null: false
    t.string   "key",                                                    null: false
    t.string   "status",                               default: "nopay"
    t.string   "title"
    t.string   "description"
    t.string   "preview_image_key"
    t.boolean  "is_private",                           default: true
    t.string   "private_password"
    t.text     "html",              limit: 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["key"], name: "index_sites_on_key", unique: true, using: :btree
  add_index "sites", ["template_id"], name: "index_sites_on_template_id", using: :btree

  create_table "templates", force: true do |t|
    t.integer  "cate_id",                                                                                null: false
    t.string   "title"
    t.decimal  "price",                                precision: 8, scale: 2,                           null: false
    t.string   "init_section_keys",                                            default: "header|footer"
    t.text     "html",              limit: 2147483647
    t.text     "form"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "templates", ["cate_id"], name: "index_templates_on_cate_id", using: :btree
  add_index "templates", ["title"], name: "index_templates_on_title", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.string   "provider"
    t.integer  "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
