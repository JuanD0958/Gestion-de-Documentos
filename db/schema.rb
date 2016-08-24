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

ActiveRecord::Schema.define(version: 20160329053526) do

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answers", ["request_id"], name: "index_answers_on_request_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "approvals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "approvals", ["user_id"], name: "index_approvals_on_user_id"

  create_table "assistences", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "signature"
    t.integer  "work_day_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "assistences", ["student_id"], name: "index_assistences_on_student_id"
  add_index "assistences", ["work_day_id"], name: "index_assistences_on_work_day_id"

  create_table "monitorings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hours"
    t.string   "assignature"
    t.text     "schelude"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "monitorings", ["user_id"], name: "index_monitorings_on_user_id"

  create_table "pings", force: :cascade do |t|
    t.integer  "work_day_id"
    t.string   "ip"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pings", ["work_day_id"], name: "index_pings_on_work_day_id"

  create_table "requests", force: :cascade do |t|
    t.text     "content"
    t.integer  "applied_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "petitioner_id"
  end

  add_index "requests", ["applied_id"], name: "index_requests_on_applied_id"
  add_index "requests", ["petitioner_id"], name: "index_requests_on_petitioner_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "full_name"
    t.string   "signature"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "full_name"
    t.string   "telephone"
    t.string   "address"
    t.string   "status"
    t.string   "signature"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "id_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "work_days", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "start_signature"
    t.string   "end_signature"
    t.string   "teacher_signature"
    t.integer  "approval_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "monitoring_id"
  end

  add_index "work_days", ["approval_id"], name: "index_work_days_on_approval_id"
  add_index "work_days", ["monitoring_id"], name: "index_work_days_on_monitoring_id"
  add_index "work_days", ["user_id"], name: "index_work_days_on_user_id"

end
