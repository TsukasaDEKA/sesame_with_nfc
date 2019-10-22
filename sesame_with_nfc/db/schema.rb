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

ActiveRecord::Schema.define(version: 2019_08_23_173228) do

  create_table "door_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "sesame_device_id"
    t.bigint "user_id"
    t.boolean "before_door_status", default: false, null: false
    t.boolean "after_door_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sesame_device_id"], name: "index_door_logs_on_sesame_device_id"
    t.index ["user_id"], name: "index_door_logs_on_user_id"
  end

  create_table "nfc_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "uid", null: false
    t.string "password", null: false
    t.boolean "is_activated", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_nfc_cards_on_user_id"
  end

  create_table "organizations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "auth_key", null: false
    t.string "sesame_api_key", null: false
    t.boolean "is_activated", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_key"], name: "index_organizations_on_auth_key", unique: true
  end

  create_table "sesame_devices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "device_id", null: false
    t.string "nickname", null: false
    t.string "serial", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_sesame_devices_on_organization_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name", null: false
    t.string "auth_key", null: false
    t.string "password_for_cms", null: false
    t.integer "roll", null: false
    t.boolean "is_activated", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_key"], name: "index_users_on_auth_key", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  add_foreign_key "door_logs", "sesame_devices"
  add_foreign_key "door_logs", "users"
  add_foreign_key "nfc_cards", "users"
  add_foreign_key "sesame_devices", "organizations"
  add_foreign_key "users", "organizations"
end
