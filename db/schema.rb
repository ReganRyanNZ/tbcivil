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

ActiveRecord::Schema.define(version: 2019_01_16_005301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer "break_minutes"
    t.string "weather"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.bigint "team_id"
    t.integer "last_hour_count", default: 0
    t.index ["team_id"], name: "index_machines_on_team_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_materials_on_team_id"
  end

  create_table "project_entries", force: :cascade do |t|
    t.string "site_condition"
    t.string "location"
    t.text "activity_description"
    t.integer "hours_worked"
    t.bigint "project_id"
    t.bigint "entry_id"
    t.bigint "team_id"
    t.index ["entry_id"], name: "index_project_entries_on_entry_id"
    t.index ["project_id"], name: "index_project_entries_on_project_id"
    t.index ["team_id"], name: "index_project_entries_on_team_id"
  end

  create_table "project_entry_machines", force: :cascade do |t|
    t.bigint "machine_id"
    t.bigint "project_entry_id"
    t.integer "start_hours"
    t.integer "finish_hours"
    t.index ["machine_id"], name: "index_project_entry_machines_on_machine_id"
    t.index ["project_entry_id"], name: "index_project_entry_machines_on_project_entry_id"
  end

  create_table "project_entry_materials", force: :cascade do |t|
    t.bigint "project_entry_id"
    t.bigint "material_id"
    t.decimal "quantity", precision: 10, scale: 2
    t.string "truck_size"
    t.index ["material_id"], name: "index_project_entry_materials_on_material_id"
    t.index ["project_entry_id"], name: "index_project_entry_materials_on_project_entry_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "project_type"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_projects_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "entries", "users"
  add_foreign_key "machines", "teams"
  add_foreign_key "materials", "teams"
  add_foreign_key "project_entries", "entries"
  add_foreign_key "project_entries", "projects"
  add_foreign_key "project_entries", "teams"
  add_foreign_key "project_entry_machines", "machines"
  add_foreign_key "project_entry_machines", "project_entries"
  add_foreign_key "project_entry_materials", "materials"
  add_foreign_key "project_entry_materials", "project_entries"
  add_foreign_key "projects", "teams"
  add_foreign_key "users", "teams"
end
