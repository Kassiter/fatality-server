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

ActiveRecord::Schema.define(version: 2020_08_18_191836) do

  create_table "charms", primary_key: "steamid", id: :string, limit: 18, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "weapons", limit: 512, default: "", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "contest_keys", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.boolean "approved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "on_date", null: false
    t.text "report"
  end

  create_table "contests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "due_date"
    t.string "con_key", default: ""
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

  create_table "logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "text", null: false
    t.date "on_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "reported", default: false
    t.integer "reported_rows", null: false
    t.decimal "m_points_add", precision: 10, default: "0"
  end

  create_table "lvl_base", primary_key: "steam", id: :string, limit: 22, collation: "utf8_general_ci", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 32, default: "", null: false
    t.integer "value", default: 0, null: false
    t.integer "rank", default: 0, null: false
    t.integer "kills", default: 0, null: false
    t.integer "deaths", default: 0, null: false
    t.integer "shoots", default: 0, null: false
    t.integer "hits", default: 0, null: false
    t.integer "headshots", default: 0, null: false
    t.integer "assists", default: 0, null: false
    t.integer "round_win", default: 0, null: false
    t.integer "round_lose", default: 0, null: false
    t.integer "playtime", default: 0, null: false
    t.integer "lastconnect", default: 0, null: false
  end

  create_table "manage_command_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manage_commands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "group", null: false
    t.string "name", null: false
    t.string "target", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "param"
    t.integer "manage_command_category_id", null: false
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

  create_table "prime_moder_tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "report"
    t.decimal "points_cost", precision: 10, default: "0"
    t.boolean "approved", default: false
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
    t.integer "m_type", default: 3
    t.string "auth_token", default: ""
    t.string "key_phrase", default: ""
    t.decimal "m_points", precision: 10, default: "0"
    t.string "avatar_secondary", default: ""
    t.string "position_name", default: ""
    t.integer "strikes", default: 0
    t.text "strikes_desc"
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

  create_table "weapons", primary_key: "steamid", id: :string, limit: 32, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "knife", default: 0, null: false
    t.integer "awp", default: 0, null: false
    t.decimal "awp_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "awp_trak", default: 0, null: false
    t.integer "awp_trak_count", default: 0, null: false
    t.string "awp_tag", limit: 256, default: "", null: false
    t.integer "awp_seed", default: -1, null: false
    t.integer "ak47", default: 0, null: false
    t.decimal "ak47_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "ak47_trak", default: 0, null: false
    t.integer "ak47_trak_count", default: 0, null: false
    t.string "ak47_tag", limit: 256, default: "", null: false
    t.integer "ak47_seed", default: -1, null: false
    t.integer "m4a1", default: 0, null: false
    t.decimal "m4a1_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "m4a1_trak", default: 0, null: false
    t.integer "m4a1_trak_count", default: 0, null: false
    t.string "m4a1_tag", limit: 256, default: "", null: false
    t.integer "m4a1_seed", default: -1, null: false
    t.integer "m4a1_silencer", default: 0, null: false
    t.decimal "m4a1_silencer_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "m4a1_silencer_trak", default: 0, null: false
    t.integer "m4a1_silencer_trak_count", default: 0, null: false
    t.string "m4a1_silencer_tag", limit: 256, default: "", null: false
    t.integer "m4a1_silencer_seed", default: -1, null: false
    t.integer "deagle", default: 0, null: false
    t.decimal "deagle_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "deagle_trak", default: 0, null: false
    t.integer "deagle_trak_count", default: 0, null: false
    t.string "deagle_tag", limit: 256, default: "", null: false
    t.integer "deagle_seed", default: -1, null: false
    t.integer "usp_silencer", default: 0, null: false
    t.decimal "usp_silencer_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "usp_silencer_trak", default: 0, null: false
    t.integer "usp_silencer_trak_count", default: 0, null: false
    t.string "usp_silencer_tag", limit: 256, default: "", null: false
    t.integer "usp_silencer_seed", default: -1, null: false
    t.integer "hkp2000", default: 0, null: false
    t.decimal "hkp2000_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "hkp2000_trak", default: 0, null: false
    t.integer "hkp2000_trak_count", default: 0, null: false
    t.string "hkp2000_tag", limit: 256, default: "", null: false
    t.integer "hkp2000_seed", default: -1, null: false
    t.integer "glock", default: 0, null: false
    t.decimal "glock_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "glock_trak", default: 0, null: false
    t.integer "glock_trak_count", default: 0, null: false
    t.string "glock_tag", limit: 256, default: "", null: false
    t.integer "glock_seed", default: -1, null: false
    t.integer "elite", default: 0, null: false
    t.decimal "elite_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "elite_trak", default: 0, null: false
    t.integer "elite_trak_count", default: 0, null: false
    t.string "elite_tag", limit: 256, default: "", null: false
    t.integer "elite_seed", default: -1, null: false
    t.integer "p250", default: 0, null: false
    t.decimal "p250_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "p250_trak", default: 0, null: false
    t.integer "p250_trak_count", default: 0, null: false
    t.string "p250_tag", limit: 256, default: "", null: false
    t.integer "p250_seed", default: -1, null: false
    t.integer "cz75a", default: 0, null: false
    t.decimal "cz75a_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "cz75a_trak", default: 0, null: false
    t.integer "cz75a_trak_count", default: 0, null: false
    t.string "cz75a_tag", limit: 256, default: "", null: false
    t.integer "cz75a_seed", default: -1, null: false
    t.integer "fiveseven", default: 0, null: false
    t.decimal "fiveseven_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "fiveseven_trak", default: 0, null: false
    t.integer "fiveseven_trak_count", default: 0, null: false
    t.string "fiveseven_tag", limit: 256, default: "", null: false
    t.integer "fiveseven_seed", default: -1, null: false
    t.integer "tec9", default: 0, null: false
    t.decimal "tec9_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "tec9_trak", default: 0, null: false
    t.integer "tec9_trak_count", default: 0, null: false
    t.string "tec9_tag", limit: 256, default: "", null: false
    t.integer "tec9_seed", default: -1, null: false
    t.integer "revolver", default: 0, null: false
    t.decimal "revolver_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "revolver_trak", default: 0, null: false
    t.integer "revolver_trak_count", default: 0, null: false
    t.string "revolver_tag", limit: 256, default: "", null: false
    t.integer "revolver_seed", default: -1, null: false
    t.integer "nova", default: 0, null: false
    t.decimal "nova_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "nova_trak", default: 0, null: false
    t.integer "nova_trak_count", default: 0, null: false
    t.string "nova_tag", limit: 256, default: "", null: false
    t.integer "nova_seed", default: -1, null: false
    t.integer "xm1014", default: 0, null: false
    t.decimal "xm1014_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "xm1014_trak", default: 0, null: false
    t.integer "xm1014_trak_count", default: 0, null: false
    t.string "xm1014_tag", limit: 256, default: "", null: false
    t.integer "xm1014_seed", default: -1, null: false
    t.integer "mag7", default: 0, null: false
    t.decimal "mag7_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "mag7_trak", default: 0, null: false
    t.integer "mag7_trak_count", default: 0, null: false
    t.string "mag7_tag", limit: 256, default: "", null: false
    t.integer "mag7_seed", default: -1, null: false
    t.integer "sawedoff", default: 0, null: false
    t.decimal "sawedoff_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "sawedoff_trak", default: 0, null: false
    t.integer "sawedoff_trak_count", default: 0, null: false
    t.string "sawedoff_tag", limit: 256, default: "", null: false
    t.integer "sawedoff_seed", default: -1, null: false
    t.integer "m249", default: 0, null: false
    t.decimal "m249_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "m249_trak", default: 0, null: false
    t.integer "m249_trak_count", default: 0, null: false
    t.string "m249_tag", limit: 256, default: "", null: false
    t.integer "m249_seed", default: -1, null: false
    t.integer "negev", default: 0, null: false
    t.decimal "negev_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "negev_trak", default: 0, null: false
    t.integer "negev_trak_count", default: 0, null: false
    t.string "negev_tag", limit: 256, default: "", null: false
    t.integer "negev_seed", default: -1, null: false
    t.integer "mp9", default: 0, null: false
    t.decimal "mp9_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "mp9_trak", default: 0, null: false
    t.integer "mp9_trak_count", default: 0, null: false
    t.string "mp9_tag", limit: 256, default: "", null: false
    t.integer "mp9_seed", default: -1, null: false
    t.integer "mac10", default: 0, null: false
    t.decimal "mac10_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "mac10_trak", default: 0, null: false
    t.integer "mac10_trak_count", default: 0, null: false
    t.string "mac10_tag", limit: 256, default: "", null: false
    t.integer "mac10_seed", default: -1, null: false
    t.integer "mp7", default: 0, null: false
    t.decimal "mp7_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "mp7_trak", default: 0, null: false
    t.integer "mp7_trak_count", default: 0, null: false
    t.string "mp7_tag", limit: 256, default: "", null: false
    t.integer "mp7_seed", default: -1, null: false
    t.integer "ump45", default: 0, null: false
    t.decimal "ump45_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "ump45_trak", default: 0, null: false
    t.integer "ump45_trak_count", default: 0, null: false
    t.string "ump45_tag", limit: 256, default: "", null: false
    t.integer "ump45_seed", default: -1, null: false
    t.integer "p90", default: 0, null: false
    t.decimal "p90_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "p90_trak", default: 0, null: false
    t.integer "p90_trak_count", default: 0, null: false
    t.string "p90_tag", limit: 256, default: "", null: false
    t.integer "p90_seed", default: -1, null: false
    t.integer "bizon", default: 0, null: false
    t.decimal "bizon_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "bizon_trak", default: 0, null: false
    t.integer "bizon_trak_count", default: 0, null: false
    t.string "bizon_tag", limit: 256, default: "", null: false
    t.integer "bizon_seed", default: -1, null: false
    t.integer "famas", default: 0, null: false
    t.decimal "famas_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "famas_trak", default: 0, null: false
    t.integer "famas_trak_count", default: 0, null: false
    t.string "famas_tag", limit: 256, default: "", null: false
    t.integer "famas_seed", default: -1, null: false
    t.integer "galilar", default: 0, null: false
    t.decimal "galilar_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "galilar_trak", default: 0, null: false
    t.integer "galilar_trak_count", default: 0, null: false
    t.string "galilar_tag", limit: 256, default: "", null: false
    t.integer "galilar_seed", default: -1, null: false
    t.integer "ssg08", default: 0, null: false
    t.decimal "ssg08_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "ssg08_trak", default: 0, null: false
    t.integer "ssg08_trak_count", default: 0, null: false
    t.string "ssg08_tag", limit: 256, default: "", null: false
    t.integer "ssg08_seed", default: -1, null: false
    t.integer "aug", default: 0, null: false
    t.decimal "aug_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "aug_trak", default: 0, null: false
    t.integer "aug_trak_count", default: 0, null: false
    t.string "aug_tag", limit: 256, default: "", null: false
    t.integer "aug_seed", default: -1, null: false
    t.integer "sg556", default: 0, null: false
    t.decimal "sg556_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "sg556_trak", default: 0, null: false
    t.integer "sg556_trak_count", default: 0, null: false
    t.string "sg556_tag", limit: 256, default: "", null: false
    t.integer "sg556_seed", default: -1, null: false
    t.integer "scar20", default: 0, null: false
    t.decimal "scar20_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "scar20_trak", default: 0, null: false
    t.integer "scar20_trak_count", default: 0, null: false
    t.string "scar20_tag", limit: 256, default: "", null: false
    t.integer "scar20_seed", default: -1, null: false
    t.integer "g3sg1", default: 0, null: false
    t.decimal "g3sg1_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "g3sg1_trak", default: 0, null: false
    t.integer "g3sg1_trak_count", default: 0, null: false
    t.string "g3sg1_tag", limit: 256, default: "", null: false
    t.integer "g3sg1_seed", default: -1, null: false
    t.integer "knife_karambit", default: 0, null: false
    t.decimal "knife_karambit_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_karambit_trak", default: 0, null: false
    t.integer "knife_karambit_trak_count", default: 0, null: false
    t.string "knife_karambit_tag", limit: 256, default: "", null: false
    t.integer "knife_karambit_seed", default: -1, null: false
    t.integer "knife_m9_bayonet", default: 0, null: false
    t.decimal "knife_m9_bayonet_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_m9_bayonet_trak", default: 0, null: false
    t.integer "knife_m9_bayonet_trak_count", default: 0, null: false
    t.string "knife_m9_bayonet_tag", limit: 256, default: "", null: false
    t.integer "knife_m9_bayonet_seed", default: -1, null: false
    t.integer "bayonet", default: 0, null: false
    t.decimal "bayonet_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "bayonet_trak", default: 0, null: false
    t.integer "bayonet_trak_count", default: 0, null: false
    t.string "bayonet_tag", limit: 256, default: "", null: false
    t.integer "bayonet_seed", default: -1, null: false
    t.integer "knife_survival_bowie", default: 0, null: false
    t.decimal "knife_survival_bowie_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_survival_bowie_trak", default: 0, null: false
    t.integer "knife_survival_bowie_trak_count", default: 0, null: false
    t.string "knife_survival_bowie_tag", limit: 256, default: "", null: false
    t.integer "knife_survival_bowie_seed", default: -1, null: false
    t.integer "knife_butterfly", default: 0, null: false
    t.decimal "knife_butterfly_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_butterfly_trak", default: 0, null: false
    t.integer "knife_butterfly_trak_count", default: 0, null: false
    t.string "knife_butterfly_tag", limit: 256, default: "", null: false
    t.integer "knife_butterfly_seed", default: -1, null: false
    t.integer "knife_flip", default: 0, null: false
    t.decimal "knife_flip_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_flip_trak", default: 0, null: false
    t.integer "knife_flip_trak_count", default: 0, null: false
    t.string "knife_flip_tag", limit: 256, default: "", null: false
    t.integer "knife_flip_seed", default: -1, null: false
    t.integer "knife_push", default: 0, null: false
    t.decimal "knife_push_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_push_trak", default: 0, null: false
    t.integer "knife_push_trak_count", default: 0, null: false
    t.string "knife_push_tag", limit: 256, default: "", null: false
    t.integer "knife_push_seed", default: -1, null: false
    t.integer "knife_tactical", default: 0, null: false
    t.decimal "knife_tactical_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_tactical_trak", default: 0, null: false
    t.integer "knife_tactical_trak_count", default: 0, null: false
    t.string "knife_tactical_tag", limit: 256, default: "", null: false
    t.integer "knife_tactical_seed", default: -1, null: false
    t.integer "knife_falchion", default: 0, null: false
    t.decimal "knife_falchion_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_falchion_trak", default: 0, null: false
    t.integer "knife_falchion_trak_count", default: 0, null: false
    t.string "knife_falchion_tag", limit: 256, default: "", null: false
    t.integer "knife_falchion_seed", default: -1, null: false
    t.integer "knife_gut", default: 0, null: false
    t.decimal "knife_gut_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_gut_trak", default: 0, null: false
    t.integer "knife_gut_trak_count", default: 0, null: false
    t.string "knife_gut_tag", limit: 256, default: "", null: false
    t.integer "knife_gut_seed", default: -1, null: false
    t.integer "knife_ursus", default: 0, null: false
    t.decimal "knife_ursus_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_ursus_trak", default: 0, null: false
    t.integer "knife_ursus_trak_count", default: 0, null: false
    t.string "knife_ursus_tag", limit: 256, default: "", null: false
    t.integer "knife_ursus_seed", default: -1, null: false
    t.integer "knife_gypsy_jackknife", default: 0, null: false
    t.decimal "knife_gypsy_jackknife_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_gypsy_jackknife_trak", default: 0, null: false
    t.integer "knife_gypsy_jackknife_trak_count", default: 0, null: false
    t.string "knife_gypsy_jackknife_tag", limit: 256, default: "", null: false
    t.integer "knife_gypsy_jackknife_seed", default: -1, null: false
    t.integer "knife_stiletto", default: 0, null: false
    t.decimal "knife_stiletto_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_stiletto_trak", default: 0, null: false
    t.integer "knife_stiletto_trak_count", default: 0, null: false
    t.string "knife_stiletto_tag", limit: 256, default: "", null: false
    t.integer "knife_stiletto_seed", default: -1, null: false
    t.integer "knife_widowmaker", default: 0, null: false
    t.decimal "knife_widowmaker_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_widowmaker_trak", default: 0, null: false
    t.integer "knife_widowmaker_trak_count", default: 0, null: false
    t.string "knife_widowmaker_tag", limit: 256, default: "", null: false
    t.integer "knife_widowmaker_seed", default: -1, null: false
    t.integer "mp5sd", default: 0, null: false
    t.decimal "mp5sd_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "mp5sd_trak", default: 0, null: false
    t.integer "mp5sd_trak_count", default: 0, null: false
    t.string "mp5sd_tag", limit: 256, default: "", null: false
    t.integer "mp5sd_seed", default: -1, null: false
    t.integer "knife_css", default: 0, null: false
    t.decimal "knife_css_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_css_trak", default: 0, null: false
    t.integer "knife_css_trak_count", default: 0, null: false
    t.string "knife_css_tag", limit: 256, default: "", null: false
    t.integer "knife_css_seed", default: -1, null: false
    t.integer "knife_cord", default: 0, null: false
    t.decimal "knife_cord_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_cord_trak", default: 0, null: false
    t.integer "knife_cord_trak_count", default: 0, null: false
    t.string "knife_cord_tag", limit: 256, default: "", null: false
    t.integer "knife_cord_seed", default: -1, null: false
    t.integer "knife_canis", default: 0, null: false
    t.decimal "knife_canis_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_canis_trak", default: 0, null: false
    t.integer "knife_canis_trak_count", default: 0, null: false
    t.string "knife_canis_tag", limit: 256, default: "", null: false
    t.integer "knife_canis_seed", default: -1, null: false
    t.integer "knife_outdoor", default: 0, null: false
    t.decimal "knife_outdoor_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_outdoor_trak", default: 0, null: false
    t.integer "knife_outdoor_trak_count", default: 0, null: false
    t.string "knife_outdoor_tag", limit: 256, default: "", null: false
    t.integer "knife_outdoor_seed", default: -1, null: false
    t.integer "knife_skeleton", default: 0, null: false
    t.decimal "knife_skeleton_float", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "knife_skeleton_trak", default: 0, null: false
    t.integer "knife_skeleton_trak_count", default: 0, null: false
    t.string "knife_skeleton_tag", limit: 256, default: "", null: false
    t.integer "knife_skeleton_seed", default: -1, null: false
  end

  create_table "weapons_timestamps", primary_key: "steamid", id: :string, limit: 32, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "last_seen", null: false
  end

end
