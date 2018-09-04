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

ActiveRecord::Schema.define(version: 20180902193324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "speaker"
    t.integer "vacancies"
    t.integer "time_load"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_registrations", id: false, force: :cascade do |t|
    t.bigint "registration_id", null: false
    t.bigint "course_id", null: false
  end

  create_table "lectures", force: :cascade do |t|
    t.string "name"
    t.string "speaker"
    t.boolean "turn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lectures_registrations", id: false, force: :cascade do |t|
    t.bigint "registration_id", null: false
    t.bigint "lecture_id", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.string "name"
    t.string "grr"
    t.string "email"
    t.string "cpf"
    t.integer "total_minutes"
    t.boolean "turn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_staffs_on_confirmation_token", unique: true
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_staffs_on_uid_and_provider", unique: true
  end

end
