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

ActiveRecord::Schema.define(version: 20171003145038) do

  create_table "boards", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "board_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_comments_on_board_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "comp_users", id: false, force: :cascade do |t|
    t.integer  "comp_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comp_id"], name: "index_comp_users_on_comp_id"
    t.index ["user_id"], name: "index_comp_users_on_user_id"
  end

  create_table "comps", force: :cascade do |t|
    t.string   "name"
    t.string   "ref_player"
    t.integer  "foo"
    t.string   "text"
    t.datetime "startdate"
    t.datetime "enddate"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comps_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "text"
    t.integer  "amount"
    t.integer  "comp_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "failed",     default: 0
    t.index ["comp_id"], name: "index_jobs_on_comp_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "prizes", force: :cascade do |t|
    t.string   "text"
    t.integer  "comp_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comp_id"], name: "index_prizes_on_comp_id"
    t.index ["user_id"], name: "index_prizes_on_user_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string   "text"
    t.integer  "comp_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comp_id"], name: "index_rules_on_comp_id"
    t.index ["user_id"], name: "index_rules_on_user_id"
  end

  create_table "showblogs", force: :cascade do |t|
    t.string   "name"
    t.datetime "rundate"
    t.string   "spec_choice"
    t.string   "level_range"
    t.string   "note"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_showblogs_on_user_id"
  end

  create_table "showruns", force: :cascade do |t|
    t.string   "other_player"
    t.string   "spec_vote"
    t.integer  "event"
    t.string   "make_other"
    t.integer  "amt"
    t.string   "level_to_make"
    t.integer  "showblog_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["showblog_id"], name: "index_showruns_on_showblog_id"
    t.index ["user_id"], name: "index_showruns_on_user_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.string   "text"
    t.integer  "comp_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comp_id"], name: "index_stories_on_comp_id"
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "player"
    t.string   "email"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "status",          default: 0
    t.string   "avh"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_votes_on_story_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
