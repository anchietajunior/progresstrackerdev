# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_13_130531) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "interview_id", null: false
    t.text "context"
    t.integer "rating"
    t.date "received_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interview_id"], name: "index_feedbacks_on_interview_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.bigint "job_application_id", null: false
    t.date "interview_at"
    t.integer "interview_type"
    t.text "details"
    t.text "interviewers_info"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_application_id"], name: "index_interviews_on_job_application_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "position"
    t.integer "status", default: 0
    t.date "applied_at"
    t.string "applied_via"
    t.string "contact_name"
    t.string "contact_email"
    t.integer "priority", default: 0
    t.text "personal_feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.string "location"
    t.integer "avaliation"
    t.text "improvements"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "feedbacks", "interviews"
  add_foreign_key "interviews", "job_applications"
  add_foreign_key "job_applications", "users"
end
