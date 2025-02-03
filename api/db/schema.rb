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

ActiveRecord::Schema[8.0].define(version: 2025_01_28_134444) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_areas_on_name", unique: true
  end

  create_table "askings", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.json "history"
    t.datetime "sent_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_askings_on_client_id"
  end

  create_table "client_areas", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_client_areas_on_area_id"
    t.index ["client_id"], name: "index_client_areas_on_client_id"
  end

  create_table "client_schedules", force: :cascade do |t|
    t.bigint "client_id", null: false, comment: "クライアントID"
    t.date "asking_date", comment: "依頼日付"
    t.string "asking_time_start", comment: "依頼開始時刻"
    t.string "asking_time_end", comment: "依頼終了時刻"
    t.string "notices", comment: "特記事項"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_schedules_on_client_id"
  end

  create_table "client_skills", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_skills_on_client_id"
    t.index ["skill_id"], name: "index_client_skills_on_skill_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "nickname"
    t.string "image"
    t.string "avatar"
    t.string "name"
    t.boolean "is_corporation", default: true
    t.string "email"
    t.string "encrypted_password"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["area_id"], name: "index_clients_on_area_id"
    t.index ["client_name"], name: "index_clients_on_client_name", unique: true
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["tel"], name: "index_clients_on_tel", unique: true
  end

  create_table "dealer_areas", force: :cascade do |t|
    t.bigint "dealer_id", null: false
    t.bigint "area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_dealer_areas_on_area_id"
    t.index ["dealer_id"], name: "index_dealer_areas_on_dealer_id"
  end

  create_table "dealer_schedules", force: :cascade do |t|
    t.bigint "dealer_id", null: false, comment: "ディーラーID"
    t.date "vacant_date", comment: "空き日付"
    t.string "vacant_time_start", comment: "空き開始時刻"
    t.string "vacant_time_end", comment: "空き終了時刻"
    t.string "notices", comment: "特記事項"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dealer_id"], name: "index_dealer_schedules_on_dealer_id"
  end

  create_table "dealer_skills", force: :cascade do |t|
    t.bigint "dealer_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dealer_id"], name: "index_dealer_skills_on_dealer_id"
    t.index ["skill_id"], name: "index_dealer_skills_on_skill_id"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "avatar"
    t.string "name"
    t.string "gender"
    t.string "email"
    t.string "encrypted_password"
    t.string "tel"
    t.string "dealer_name"
    t.string "url_x"
    t.integer "fee_min"
    t.integer "fee_max"
    t.string "payment_account"
    t.string "notices"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_becoming"
    t.datetime "deleted_at"
    t.index ["dealer_name"], name: "index_dealers_on_dealer_name", unique: true
    t.index ["email"], name: "index_dealers_on_email", unique: true
    t.index ["tel"], name: "index_dealers_on_tel", unique: true
  end

  create_table "evaluation_clients", force: :cascade do |t|
    t.bigint "dealer_id"
    t.bigint "client_id"
    t.string "content"
    t.integer "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_evaluation_clients_on_client_id"
    t.index ["dealer_id"], name: "index_evaluation_clients_on_dealer_id"
  end

  create_table "evaluation_dealers", force: :cascade do |t|
    t.bigint "dealer_id"
    t.bigint "client_id"
    t.string "content"
    t.integer "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_evaluation_dealers_on_client_id"
    t.index ["dealer_id"], name: "index_evaluation_dealers_on_dealer_id"
  end

  create_table "recruits", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "deadline", precision: nil
    t.datetime "startAt", precision: nil
    t.datetime "endAt", precision: nil
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_recruits_on_area_id"
    t.index ["client_id"], name: "index_recruits_on_client_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_skills_on_name", unique: true
  end

  add_foreign_key "askings", "clients"
  add_foreign_key "client_areas", "areas"
  add_foreign_key "client_areas", "clients"
  add_foreign_key "client_schedules", "clients"
  add_foreign_key "client_skills", "clients"
  add_foreign_key "client_skills", "skills"
  add_foreign_key "clients", "areas"
  add_foreign_key "dealer_areas", "areas"
  add_foreign_key "dealer_areas", "dealers"
  add_foreign_key "dealer_schedules", "dealers"
  add_foreign_key "dealer_skills", "dealers"
  add_foreign_key "dealer_skills", "skills"
  add_foreign_key "evaluation_clients", "clients"
  add_foreign_key "evaluation_clients", "dealers"
  add_foreign_key "evaluation_dealers", "clients"
  add_foreign_key "evaluation_dealers", "dealers"
  add_foreign_key "recruits", "areas"
  add_foreign_key "recruits", "clients"
end
