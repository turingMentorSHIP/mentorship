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

ActiveRecord::Schema.define(version: 20160804203607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
  end

  create_table "mentor_timezones", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "location"
    t.text     "bio"
    t.integer  "mentor_timezone_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "active",             default: true
    t.index ["mentor_timezone_id"], name: "index_mentors_on_mentor_timezone_id", using: :btree
    t.index ["user_id"], name: "index_mentors_on_user_id", using: :btree
  end

  create_table "posses", force: :cascade do |t|
    t.string   "name"
    t.string   "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cohort_id"
    t.boolean "active",    default: true
    t.index ["cohort_id"], name: "index_students_on_cohort_id", using: :btree
    t.index ["user_id"], name: "index_students_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "bio"
    t.string   "picture"
    t.integer  "posse_id",   default: 1
    t.string   "slack_name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "uid"
    t.string   "token"
    t.index ["posse_id"], name: "index_users_on_posse_id", using: :btree
  end

  add_foreign_key "mentors", "mentor_timezones"
  add_foreign_key "mentors", "users"
  add_foreign_key "students", "cohorts"
  add_foreign_key "students", "users"
  add_foreign_key "users", "posses", column: "posse_id"
end
