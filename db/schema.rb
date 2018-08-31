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

ActiveRecord::Schema.define(version: 20180831000103) do

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "speaker"
    t.integer "vacancies"
    t.integer "duration_in_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_registrations", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "registration_id", null: false
    t.bigint "course_id", null: false
  end

  create_table "lectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "duration_in_minutes"
    t.string "speaker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lectures_registrations", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "registration_id", null: false
    t.bigint "lecture_id", null: false
  end

  create_table "registrations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "grr"
    t.string "email"
    t.string "cpf"
    t.integer "total_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
