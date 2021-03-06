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

ActiveRecord::Schema.define(version: 20140812190036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "id_integer"
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
    t.integer  "student_id"
    t.integer  "teacher_id"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "notebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  add_index "comments", ["notebook_id"], name: "index_comments_on_notebook_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "short_name"
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_students", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "student_id"
  end

  create_table "courses_teachers", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "teacher_id"
  end

  create_table "lectures", force: true do |t|
    t.integer  "course_id"
    t.date     "date"
    t.string   "title"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lectures", ["course_id"], name: "index_lectures_on_course_id", using: :btree

  create_table "notebooks", force: true do |t|
    t.text     "text"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lecture_id"
    t.integer  "account_id"
  end

  create_table "students", force: true do |t|
    t.integer "account_id"
  end

  create_table "teachers", force: true do |t|
    t.integer "account_id"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
