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

ActiveRecord::Schema.define(version: 2024_06_13_064356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "client_areas", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_client_areas_on_area_id"
    t.index ["client_id"], name: "index_client_areas_on_client_id"
  end

  create_table "client_skills", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_client_skills_on_client_id"
    t.index ["skill_id"], name: "index_client_skills_on_skill_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "avatar"
    t.string "name"
    t.boolean "is_corporation", default: true
    t.string "email"
    t.string "tel"
    t.string "client_name"
    t.string "url_x"
    t.bigint "area_id"
    t.boolean "is_secret_address", default: false
    t.string "address"
    t.integer "pay_min"
    t.integer "pay_max"
    t.boolean "is_uniform"
    t.string "notices"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_clients_on_area_id"
    t.index ["client_name"], name: "index_clients_on_client_name", unique: true
    t.index ["confirmation_token"], name: "index_clients_on_confirmation_token", unique: true
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
    t.index ["tel"], name: "index_clients_on_tel", unique: true
    t.index ["uid", "provider"], name: "index_clients_on_uid_and_provider", unique: true
  end

  create_table "dealer_areas", force: :cascade do |t|
    t.bigint "dealer_id", null: false
    t.bigint "area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_dealer_areas_on_area_id"
    t.index ["dealer_id"], name: "index_dealer_areas_on_dealer_id"
  end

  create_table "dealer_skills", force: :cascade do |t|
    t.bigint "dealer_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_id"], name: "index_dealer_skills_on_dealer_id"
    t.index ["skill_id"], name: "index_dealer_skills_on_skill_id"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "avatar"
    t.string "name"
    t.string "gender"
    t.string "email"
    t.string "tel"
    t.string "dealer_name"
    t.string "url_x"
    t.integer "years_of_experience"
    t.integer "fee_min"
    t.integer "fee_max"
    t.string "payment_account"
    t.string "notices"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_dealers_on_confirmation_token", unique: true
    t.index ["dealer_name"], name: "index_dealers_on_dealer_name", unique: true
    t.index ["email"], name: "index_dealers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_dealers_on_reset_password_token", unique: true
    t.index ["tel"], name: "index_dealers_on_tel", unique: true
    t.index ["uid", "provider"], name: "index_dealers_on_uid_and_provider", unique: true
  end

  create_table "evaluation_clients", force: :cascade do |t|
    t.bigint "dealer_id"
    t.bigint "client_id"
    t.string "content"
    t.integer "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_evaluation_clients_on_client_id"
    t.index ["dealer_id"], name: "index_evaluation_clients_on_dealer_id"
  end

  create_table "evaluation_dealers", force: :cascade do |t|
    t.bigint "dealer_id"
    t.bigint "client_id"
    t.string "content"
    t.integer "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_evaluation_dealers_on_client_id"
    t.index ["dealer_id"], name: "index_evaluation_dealers_on_dealer_id"
  end

  create_table "recruits", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "deadline"
    t.datetime "startAt"
    t.datetime "endAt"
    t.bigint "client_id"
    t.bigint "area_id"
    t.integer "fee_min"
    t.integer "fee_max"
    t.boolean "is_night_fee", default: false
    t.boolean "is_transportation_fee", default: false
    t.boolean "is_uniform"
    t.string "notices_uniform"
    t.string "job_description"
    t.string "notices"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_recruits_on_area_id"
    t.index ["client_id"], name: "index_recruits_on_client_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "client_areas", "areas"
  add_foreign_key "client_areas", "clients"
  add_foreign_key "client_skills", "clients"
  add_foreign_key "client_skills", "skills"
  add_foreign_key "clients", "areas"
  add_foreign_key "dealer_areas", "areas"
  add_foreign_key "dealer_areas", "dealers"
  add_foreign_key "dealer_skills", "dealers"
  add_foreign_key "dealer_skills", "skills"
  add_foreign_key "evaluation_clients", "clients"
  add_foreign_key "evaluation_clients", "dealers"
  add_foreign_key "recruits", "areas"
  add_foreign_key "recruits", "clients"
end
