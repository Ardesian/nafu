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

ActiveRecord::Schema.define(version: 2018_11_30_233458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "fname"
    t.string "mname"
    t.string "lname"
    t.string "email"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "cell_phone"
    t.string "home_phone"
    t.boolean "citizen"
    t.boolean "felony"
    t.text "education"
    t.text "references"
    t.datetime "approved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "duties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "product_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_goals_on_product_id"
    t.index ["project_id"], name: "index_goals_on_project_id"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "tray_id"
    t.bigint "task_id"
    t.bigint "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_notes_on_author_id"
    t.index ["task_id"], name: "index_notes_on_task_id"
    t.index ["tray_id"], name: "index_notes_on_tray_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "product_sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "amount_per_tray"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shifts_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shift_id"
    t.bigint "product_id"
    t.bigint "tray_id"
    t.bigint "duty_id"
    t.integer "filled"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["duty_id"], name: "index_tasks_on_duty_id"
    t.index ["product_id"], name: "index_tasks_on_product_id"
    t.index ["shift_id"], name: "index_tasks_on_shift_id"
    t.index ["tray_id"], name: "index_tasks_on_tray_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "trays", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "product_id"
    t.integer "tray_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_trays_on_product_id"
    t.index ["project_id"], name: "index_trays_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "mname"
    t.string "lname"
    t.integer "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
