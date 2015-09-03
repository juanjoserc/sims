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

ActiveRecord::Schema.define(version: 20150831133828) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "user_role_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id"
  add_index "assignments", ["user_role_id"], name: "index_assignments_on_user_role_id"

  create_table "notes", force: :cascade do |t|
    t.text     "note"
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["ticket_id"], name: "index_notes_on_ticket_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ticket_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "subject"
    t.text     "description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "estimated_resolution_time"
    t.integer  "service_id"
    t.integer  "ticket_status_id"
    t.integer  "user_id"
    t.string   "attachment"
    t.integer  "tech_id"
  end

  add_index "tickets", ["service_id"], name: "index_tickets_on_service_id"
  add_index "tickets", ["tech_id"], name: "index_tickets_on_tech_id"
  add_index "tickets", ["ticket_status_id"], name: "index_tickets_on_ticket_status_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "user_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
