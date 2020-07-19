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

ActiveRecord::Schema.define(version: 2020_07_19_122909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  create_table "privilieges", force: :cascade do |t|
    t.string "name", null: false
    t.string "link_lifetime", null: false
    t.string "link_month", null: false
    t.decimal "cost_lifetime", null: false
    t.decimal "cost_month", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

end
