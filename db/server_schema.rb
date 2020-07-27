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

ActiveRecord::Schema.define(version: 2020_07_27_095524) do

  create_table "contests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "due_date"
  end

  create_table "contests_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "contest_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "winner", default: false
  end

  create_table "gloves", primary_key: "steamid", id: :string, limit: 32, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "t_group", default: 0, null: false
    t.integer "t_glove", default: 0, null: false
    t.decimal "t_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "ct_group", default: 0, null: false
    t.integer "ct_glove", default: 0, null: false
    t.decimal "ct_float", precision: 3, scale: 2, default: "0.0", null: false
  end

  create_table "keys_blocked_players", primary_key: "auth", id: :string, limit: 24, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "block_end", null: false, unsigned: true
    t.integer "sid", null: false
  end

  create_table "keys_players_used", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "auth", limit: 24, null: false
    t.string "key_name", limit: 64, null: false
    t.integer "sid", null: false
  end

  create_table "keys_servers", primary_key: "sid", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address", limit: 24, null: false
    t.index ["address"], name: "address", unique: true
  end

  create_table "moder_contests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "due_date"
  end

  create_table "moder_contests_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "moder_contest_id", null: false
    t.boolean "winner", null: false
    t.integer "age", null: false
    t.string "experience", null: false
    t.string "reason", null: false
  end

  create_table "personal_features", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "img_url", null: false
    t.string "option_name_basic", null: false
    t.string "option_name_advanced", null: false
    t.string "option_basic_link", null: false
    t.string "option_advanced_link", null: false
    t.decimal "option_basic_cost", precision: 10, null: false
    t.decimal "option_advanced_cost", precision: 10, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tooltip", default: ""
    t.boolean "login_locked", default: false
  end

  create_table "personal_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "description", default: ""
    t.boolean "done", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "used", default: false
    t.integer "lifetime", default: 0
    t.integer "user_id"
  end

  create_table "privilieges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "link_lifetime", null: false
    t.string "link_month", null: false
    t.decimal "cost_lifetime", precision: 10, null: false
    t.decimal "cost_month", precision: 10, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "privilieges_features", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "icon", null: false
    t.string "description", null: false
    t.string "misc", default: ""
    t.string "tooltip", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "vip_type", default: ""
  end

  create_table "privilieges_privilieges_features", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "priviliege_id", null: false
    t.bigint "privilieges_feature_id", null: false
  end

  create_table "refunds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "when_buyed"
    t.string "buyer_nickname"
    t.string "priviliege_type"
    t.string "proofs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "shop_boughts", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "item_id", null: false
    t.integer "count", null: false
    t.integer "duration", null: false
    t.integer "timeleft", null: false
    t.integer "buy_price", null: false
    t.integer "sell_price", null: false
    t.integer "buy_time"
  end

  create_table "shop_items", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "category", limit: 64, null: false
    t.string "item", limit: 64, null: false
  end

  create_table "shop_players", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 32, default: "unknown", null: false
    t.string "auth", limit: 22, null: false
    t.integer "money", null: false
    t.integer "lastconnect"
    t.index ["auth"], name: "auth", unique: true
  end

  create_table "shop_toggles", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "item_id", null: false
    t.integer "state", limit: 1, default: 0, null: false
  end

  create_table "sm_cookie_cache", primary_key: ["player", "cookie_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "player", limit: 65, null: false
    t.integer "cookie_id", null: false
    t.string "value", limit: 100
    t.integer "timestamp", null: false
  end

  create_table "sm_cookies", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "description"
    t.integer "access"
    t.index ["name"], name: "name", unique: true
  end

  create_table "table_keys", primary_key: "key_name", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", limit: 64, null: false
    t.integer "expires", default: 0, null: false, unsigned: true
    t.integer "uses", default: 1, null: false, unsigned: true
    t.integer "sid", null: false
    t.string "param1", limit: 64
    t.string "param2", limit: 64
    t.string "param3", limit: 64
    t.string "param4", limit: 64
    t.string "param5", limit: 64
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vip_keys_block_players", primary_key: "auth", id: :string, limit: 24, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "end", null: false
  end

  create_table "vip_users", primary_key: ["account_id", "sid"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "name", limit: 64, default: "unknown", null: false
    t.integer "lastvisit", default: 0, null: false, unsigned: true
    t.integer "sid", null: false, unsigned: true
    t.string "group", limit: 64, null: false
    t.integer "expires", default: 0, null: false, unsigned: true
  end

  create_table "weaponpaints", primary_key: "steamid", id: :string, limit: 32, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "playername", limit: 128, null: false
    t.integer "last_accountuse", null: false
    t.string "weapon_negev", limit: 64, default: "none", null: false
    t.string "weapon_m249", limit: 64, default: "none", null: false
    t.string "weapon_bizon", limit: 64, default: "none", null: false
    t.string "weapon_p90", limit: 64, default: "none", null: false
    t.string "weapon_scar20", limit: 64, default: "none", null: false
    t.string "weapon_g3sg1", limit: 64, default: "none", null: false
    t.string "weapon_m4a1", limit: 64, default: "none", null: false
    t.string "weapon_m4a1_silencer", limit: 64, default: "none", null: false
    t.string "weapon_ak47", limit: 64, default: "none", null: false
    t.string "weapon_aug", limit: 64, default: "none", null: false
    t.string "weapon_galilar", limit: 64, default: "none", null: false
    t.string "weapon_awp", limit: 64, default: "none", null: false
    t.string "weapon_sg556", limit: 64, default: "none", null: false
    t.string "weapon_ump45", limit: 64, default: "none", null: false
    t.string "weapon_mp7", limit: 64, default: "none", null: false
    t.string "weapon_famas", limit: 64, default: "none", null: false
    t.string "weapon_mp9", limit: 64, default: "none", null: false
    t.string "weapon_mac10", limit: 64, default: "none", null: false
    t.string "weapon_ssg08", limit: 64, default: "none", null: false
    t.string "weapon_nova", limit: 64, default: "none", null: false
    t.string "weapon_xm1014", limit: 64, default: "none", null: false
    t.string "weapon_sawedoff", limit: 64, default: "none", null: false
    t.string "weapon_mag7", limit: 64, default: "none", null: false
    t.string "weapon_elite", limit: 64, default: "none", null: false
    t.string "weapon_deagle", limit: 64, default: "none", null: false
    t.string "weapon_tec9", limit: 64, default: "none", null: false
    t.string "weapon_fiveseven", limit: 64, default: "none", null: false
    t.string "weapon_cz75a", limit: 64, default: "none", null: false
    t.string "weapon_glock", limit: 64, default: "none", null: false
    t.string "weapon_usp_silencer", limit: 64, default: "none", null: false
    t.string "weapon_p250", limit: 64, default: "none", null: false
    t.string "weapon_hkp2000", limit: 64, default: "none", null: false
    t.string "weapon_bayonet", limit: 64, default: "none", null: false
    t.string "weapon_knife_gut", limit: 64, default: "none", null: false
    t.string "weapon_knife_flip", limit: 64, default: "none", null: false
    t.string "weapon_knife_m9_bayonet", limit: 64, default: "none", null: false
    t.string "weapon_knife_karambit", limit: 64, default: "none", null: false
    t.string "weapon_knife_tactical", limit: 64, default: "none", null: false
    t.string "weapon_knife_butterfly", limit: 64, default: "none", null: false
    t.string "weapon_c4", limit: 64, default: "none", null: false
    t.string "weapon_knife_falchion", limit: 64, default: "none", null: false
    t.string "favorite1", limit: 64, default: "none", null: false
    t.string "favorite2", limit: 64, default: "none", null: false
    t.string "favorite3", limit: 64, default: "none", null: false
    t.string "favorite4", limit: 64, default: "none", null: false
    t.string "favorite5", limit: 64, default: "none", null: false
    t.string "favorite6", limit: 64, default: "none", null: false
    t.string "favorite7", limit: 64, default: "none", null: false
  end

end
