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

ActiveRecord::Schema.define(version: 20181103054813) do

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image"
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "item_name", null: false
    t.string "description", null: false
    t.string "size"
    t.string "condition", null: false
    t.string "charge_method", null: false
    t.integer "prefecture", null: false
    t.string "handling_time", null: false
    t.integer "price", null: false
    t.integer "user_id", null: false
    t.integer "saler_id"
    t.integer "buyer_id"
    t.integer "large_category_id", null: false
    t.integer "medium_category_id", null: false
    t.integer "small_category_id", null: false
    t.integer "bland_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "delivery_method"
    t.index ["user_id", "saler_id", "buyer_id", "bland_id"], name: "index_items_on_user_id_and_saler_id_and_buyer_id_and_bland_id"
  end

  create_table "large_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "large_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medium_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "medium_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "small_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "small_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "kana_family_name", null: false
    t.string "kana_first_name", null: false
    t.date "birthday", null: false
    t.integer "prefecture", default: 0, null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "residential_name"
    t.integer "phone_number", null: false
    t.integer "postal_code", null: false
    t.text "profile"
    t.string "user_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nickname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
