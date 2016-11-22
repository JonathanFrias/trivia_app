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

ActiveRecord::Schema.define(version: 20161122002814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "answer"
    t.integer  "trivia_question_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["trivia_question_id"], name: "index_answers_on_trivia_question_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "rs_evaluations", force: :cascade do |t|
    t.string   "reputation_name"
    t.string   "source_type"
    t.integer  "source_id"
    t.string   "target_type"
    t.integer  "target_id"
    t.float    "value",           default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
    t.index ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true, using: :btree
    t.index ["reputation_name"], name: "index_rs_evaluations_on_reputation_name", using: :btree
    t.index ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type", using: :btree
    t.index ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type", using: :btree
  end

  create_table "rs_reputation_messages", force: :cascade do |t|
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.float    "weight",      default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true, using: :btree
    t.index ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type", using: :btree
  end

  create_table "rs_reputations", force: :cascade do |t|
    t.string   "reputation_name"
    t.float    "value",           default: 0.0
    t.string   "aggregated_by"
    t.string   "target_type"
    t.integer  "target_id"
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
    t.index ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true, using: :btree
    t.index ["reputation_name"], name: "index_rs_reputations_on_reputation_name", using: :btree
    t.index ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "trivia_question_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["trivia_question_id"], name: "index_taggings_on_trivia_question_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trivia_questions", force: :cascade do |t|
    t.string   "question"
    t.integer  "user_id"
    t.string   "correct_answer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_trivia_questions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "longest_correct_streak",   default: 0
    t.integer  "longest_incorrect_streak", default: 0
    t.integer  "current_correct_streak",   default: 0
    t.integer  "current_incorrect_streak", default: 0
  end

  add_foreign_key "answers", "trivia_questions"
  add_foreign_key "answers", "users"
  add_foreign_key "taggings", "tags"
  add_foreign_key "taggings", "trivia_questions"
  add_foreign_key "trivia_questions", "users"
end
