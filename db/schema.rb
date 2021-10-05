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

ActiveRecord::Schema.define(version: 2021_09_29_211614) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "email_address"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin_role", default: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "applicants", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "email_address"
    t.string "phone_number"
    t.string "property_applied"
    t.string "property_occupied"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin_role", default: false
    t.index ["email"], name: "index_applicants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true
  end

  create_table "applications", force: :cascade do |t|
    t.datetime "date_time"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "applicant_id", null: false
    t.integer "property_id", null: false
    t.index ["applicant_id"], name: "index_applications_on_applicant_id"
    t.index ["property_id"], name: "index_applications_on_property_id"
  end

  create_table "leasing_agents", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "email_address"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin_role", default: false
    t.index ["email"], name: "index_leasing_agents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_leasing_agents_on_reset_password_token", unique: true
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "size"
    t.boolean "features_pets"
    t.boolean "features_laundry"
    t.boolean "features_parking"
    t.string "terms_available"
    t.datetime "earliest_start_time"
    t.integer "application_fee"
    t.integer "monthly_rent"
    t.string "occupied_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "leasing_agent_id", null: false
    t.boolean "availability"
    t.integer "occupant_id"
    t.index ["leasing_agent_id"], name: "index_properties_on_leasing_agent_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "waitlists", force: :cascade do |t|
    t.string "applicants"
    t.datetime "date_time"
    t.string "property"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "applications", "applicants"
  add_foreign_key "applications", "properties"
  add_foreign_key "properties", "leasing_agents"
end
