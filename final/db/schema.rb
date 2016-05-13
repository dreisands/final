# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 0) do

  create_table "collections", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.date    "date_added"
    t.integer "rating"
    t.integer "expansion_id"
  end

  add_index "collections", ["expansion_id"], name: "index_collections_on_expansion_id"
  add_index "collections", ["game_id"], name: "index_collections_on_game_id"
  add_index "collections", ["player_id"], name: "index_collections_on_player_id"

  create_table "expansions", force: :cascade do |t|
    t.integer "game_id"
    t.text    "title"
    t.text    "cover_url"
    t.integer "min_age"
    t.integer "year"
    t.text    "description"
    t.integer "playtime"
    t.integer "min_players"
    t.integer "max_players"
  end

  add_index "expansions", ["game_id"], name: "index_expansions_on_game_id"

  create_table "games", force: :cascade do |t|
    t.text    "title"
    t.text    "cover_url"
    t.integer "min_age"
    t.integer "year"
    t.text    "description"
    t.integer "playtime"
    t.integer "min_players"
    t.integer "max_players"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player1_id"
    t.integer "player2_id"
    t.integer "player3_id"
    t.integer "player4_id"
    t.integer "player5_id"
    t.integer "player1_score"
    t.integer "player2_score"
    t.integer "player3_score"
    t.integer "player4_score"
    t.integer "player5_score"
    t.boolean "player1_won",   default: false
    t.boolean "player2_won",   default: false
    t.boolean "player3_won",   default: false
    t.boolean "player4_won",   default: false
    t.boolean "player5_won",   default: false
  end

  add_index "sessions", ["game_id"], name: "index_sessions_on_game_id"
  add_index "sessions", ["player1_id"], name: "index_sessions_on_player1_id"
  add_index "sessions", ["player2_id"], name: "index_sessions_on_player2_id"
  add_index "sessions", ["player3_id"], name: "index_sessions_on_player3_id"
  add_index "sessions", ["player4_id"], name: "index_sessions_on_player4_id"
  add_index "sessions", ["player5_id"], name: "index_sessions_on_player5_id"

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password"
  end

end
