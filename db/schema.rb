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

ActiveRecord::Schema.define(version: 2018_11_10_045955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer "break_minutes"
  end

  create_table "job_entries", force: :cascade do |t|
    t.string "weather"
    t.string "site_condition"
    t.string "location"
    t.text "activity_description"
    t.integer "hours_worked"
    t.bigint "job_id"
    t.bigint "entry_id"
    t.index ["entry_id"], name: "index_job_entries_on_entry_id"
    t.index ["job_id"], name: "index_job_entries_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "project_type"
  end

  create_table "machine_job_entries", force: :cascade do |t|
    t.bigint "machine_id"
    t.bigint "job_entry_id"
    t.integer "start_hours"
    t.integer "finish_hours"
    t.index ["job_entry_id"], name: "index_machine_job_entries_on_job_entry_id"
    t.index ["machine_id"], name: "index_machine_job_entries_on_machine_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "job_entries", "entries"
  add_foreign_key "job_entries", "jobs"
  add_foreign_key "machine_job_entries", "job_entries"
  add_foreign_key "machine_job_entries", "machines"
end
