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

ActiveRecord::Schema.define(version: 20170212190042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.integer  "campaign_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["campaign_id"], name: "index_candidates_on_campaign_id", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "time"
    t.integer  "campaign_id"
    t.integer  "candidate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "validity"
    t.index ["campaign_id"], name: "index_votes_on_campaign_id", using: :btree
    t.index ["candidate_id"], name: "index_votes_on_candidate_id", using: :btree
  end

  add_foreign_key "candidates", "campaigns"
  add_foreign_key "votes", "campaigns"
  add_foreign_key "votes", "candidates"
end
