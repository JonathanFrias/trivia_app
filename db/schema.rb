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

ActiveRecord::Schema.define(version: 20161121074714) do

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
    t.integer  "score",                    default: 0, null: false
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
