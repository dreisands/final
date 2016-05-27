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
    t.date    "date_added"
    t.integer "rating"
    t.integer "user_id"
  end

  add_index "collections", ["game_id"], name: "index_collections_on_game_id"
  add_index "collections", ["user_id"], name: "index_collections_on_user_id"

  create_table "expansions", force: :cascade do |t|
    t.integer "base_id"
    t.integer "expansion_game_id"
  end

  add_index "expansions", ["base_id"], name: "index_expansions_on_base_id"
  add_index "expansions", ["expansion_game_id"], name: "index_expansions_on_expansion_game_id"

  create_table "game_participants", force: :cascade do |t|
    t.integer "game_session_id"
    t.integer "user_id"
    t.integer "score"
    t.boolean "did_win",         default: false
  end

  add_index "game_participants", ["game_session_id"], name: "index_game_participants_on_game_session_id"
  add_index "game_participants", ["user_id"], name: "index_game_participants_on_user_id"

  create_table "game_sessions", force: :cascade do |t|
    t.integer "game_id"
    t.date    "played_on"
  end

  add_index "game_sessions", ["game_id"], name: "index_game_sessions_on_game_id"

  create_table "games", force: :cascade do |t|
    t.text    "title"
    t.text    "cover_url"
    t.integer "min_age"
    t.integer "year"
    t.text    "description"
    t.integer "min_players"
    t.integer "max_players"
    t.integer "min_playtime"
    t.integer "max_playtime"
    t.boolean "is_expansion", default: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password_digest"
  end

end
