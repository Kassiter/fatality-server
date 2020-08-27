# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_27_125612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contest_keys", force: :cascade do |t|
    t.string "key", null: false
    t.boolean "approved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "on_date", null: false
    t.text "report"
  end

  create_table "contests", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "due_date"
    t.string "con_key", default: ""
  end

  create_table "contests_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "contest_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "winner", default: false
  end

  create_table "logs", force: :cascade do |t|
    t.text "text", null: false
    t.date "on_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "reported_rows", default: [], array: true
    t.boolean "reported", default: false
  end

  create_table "manage_command_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manage_commands", force: :cascade do |t|
    t.string "group", null: false
    t.string "name", null: false
    t.string "target", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "param"
    t.integer "manage_command_category_id", null: false
  end

  create_table "moder_contests", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "due_date"
  end

  create_table "moder_contests_users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "moder_contest_id", null: false
    t.boolean "winner", null: false
    t.integer "age", null: false
    t.string "experience", null: false
    t.string "reason", null: false
  end

  create_table "personal_features", force: :cascade do |t|
    t.string "name", null: false
    t.string "img_url", null: false
    t.string "option_name_basic", null: false
    t.string "option_name_advanced", null: false
    t.string "option_basic_link", null: false
    t.string "option_advanced_link", null: false
    t.decimal "option_basic_cost", null: false
    t.decimal "option_advanced_cost", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tooltip", default: ""
    t.boolean "login_locked", default: false
    t.integer "discount"
  end

  create_table "personal_items", force: :cascade do |t|
    t.string "key", null: false
    t.string "description", default: ""
    t.boolean "done", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "used", default: false
    t.integer "lifetime", default: 0
    t.integer "user_id"
  end

  create_table "previlegies_keys", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prime_moder_tasks", force: :cascade do |t|
    t.string "name", null: false
    t.text "report"
    t.decimal "points_cost", default: "0.0"
    t.boolean "approved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "privilieges", force: :cascade do |t|
    t.string "name", null: false
    t.string "link_lifetime", null: false
    t.string "link_month", null: false
    t.decimal "cost_lifetime", null: false
    t.decimal "cost_month", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "discount"
  end

  create_table "privilieges_features", force: :cascade do |t|
    t.string "icon", null: false
    t.string "description", null: false
    t.string "misc", default: ""
    t.string "tooltip", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "vip_type", default: ""
  end

  create_table "privilieges_privilieges_features", id: false, force: :cascade do |t|
    t.bigint "priviliege_id", null: false
    t.bigint "privilieges_feature_id", null: false
  end

  create_table "refunds", force: :cascade do |t|
    t.string "when_buyed"
    t.string "buyer_nickname"
    t.string "priviliege_type"
    t.string "proofs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "suspect_nickname", null: false
    t.text "details", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.boolean "approved", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
    t.string "steamID", default: ""
    t.string "nickname", default: ""
    t.string "profile_url", default: ""
    t.string "steamID64", default: ""
    t.string "avatar_url", default: ""
    t.integer "m_type", default: 3
    t.string "auth_token", default: ""
    t.string "key_phrase", default: ""
    t.decimal "m_points", default: "0.0"
    t.string "avatar_secondary", default: ""
    t.string "position_name", default: ""
    t.integer "strikes", default: 0
    t.text "strikes_desc"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
