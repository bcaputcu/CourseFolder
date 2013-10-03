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

ActiveRecord::Schema.define(version: 20131003142216) do

  create_table "courses", force: true do |t|
    t.integer  "school_id",       null: false
    t.string   "name",            null: false
    t.string   "code",            null: false
    t.string   "instructor_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id"

  create_table "due_dates", force: true do |t|
    t.integer  "section_id",      null: false
    t.integer  "task_id",         null: false
    t.datetime "expiry_datetime", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "due_dates", ["section_id"], name: "index_due_dates_on_section_id"
  add_index "due_dates", ["task_id", "section_id"], name: "index_due_dates_on_task_id_and_section_id", unique: true
  add_index "due_dates", ["task_id"], name: "index_due_dates_on_task_id"

  create_table "enrollments", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "section_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollments", ["section_id"], name: "index_enrollments_on_section_id"
  add_index "enrollments", ["user_id", "section_id"], name: "index_enrollments_on_user_id_and_section_id", unique: true
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id"

  create_table "flags", force: true do |t|
    t.integer  "user_id",                   null: false
    t.boolean  "new_user",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flags", ["user_id"], name: "index_flags_on_user_id"

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.string   "link"
    t.string   "icon"
    t.boolean  "is_seen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "reminders", force: true do |t|
    t.integer  "task_id",         null: false
    t.integer  "user_id",         null: false
    t.datetime "expiry_datetime", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reminders", ["task_id", "user_id"], name: "index_reminders_on_task_id_and_user_id"
  add_index "reminders", ["task_id"], name: "index_reminders_on_task_id"
  add_index "reminders", ["user_id"], name: "index_reminders_on_user_id"

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "course_id",  null: false
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["course_id"], name: "index_sections_on_course_id"

  create_table "settings", force: true do |t|
    t.integer  "user_id",                                            null: false
    t.integer  "default_reminder_seconds",          default: 259200
    t.boolean  "notify_new_tasks",                  default: true
    t.boolean  "notify_new_tasks_without_due_date", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["user_id"], name: "index_settings_on_user_id"

  create_table "statistics", force: true do |t|
    t.integer  "user_id",                       null: false
    t.integer  "tasks_created",     default: 0
    t.integer  "reminders_expired", default: 0
    t.integer  "tasks_completed",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statistics", ["user_id"], name: "index_statistics_on_user_id"

  create_table "tasks", force: true do |t|
    t.integer  "owner_id",    null: false
    t.integer  "course_id",   null: false
    t.string   "category"
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["course_id", "owner_id"], name: "index_tasks_on_course_id_and_owner_id"
  add_index "tasks", ["course_id"], name: "index_tasks_on_course_id"
  add_index "tasks", ["owner_id"], name: "index_tasks_on_owner_id"

  create_table "time_slots", force: true do |t|
    t.integer  "section_id", null: false
    t.time     "start_time", null: false
    t.time     "end_time",   null: false
    t.integer  "day",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_slots", ["section_id"], name: "index_time_slots_on_section_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["school_id"], name: "index_users_on_school_id"

end
