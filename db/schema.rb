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

ActiveRecord::Schema.define(version: 2019_09_09_130810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.bigint "work_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_order_id"], name: "index_categories_on_work_order_id"
  end

  create_table "managers", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.boolean "done"
    t.bigint "work_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_order_id"], name: "index_tasks_on_work_order_id"
  end

  create_table "team_leaders", force: :cascade do |t|
    t.string "team_name"
    t.bigint "user_id"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_team_leaders_on_manager_id"
    t.index ["user_id"], name: "index_team_leaders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_orders", force: :cascade do |t|
    t.integer "priority"
    t.string "address"
    t.datetime "due_date"
    t.datetime "due_time"
    t.text "description"
    t.datetime "completion_date"
    t.string "start_photo"
    t.string "end_photo"
    t.bigint "team_leader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.text "report"
    t.integer "status"
    t.string "photo"
    t.index ["team_leader_id"], name: "index_work_orders_on_team_leader_id"
  end

  add_foreign_key "categories", "work_orders"
  add_foreign_key "managers", "users"
  add_foreign_key "tasks", "work_orders"
  add_foreign_key "team_leaders", "managers"
  add_foreign_key "team_leaders", "users"
  add_foreign_key "work_orders", "team_leaders"
end
