# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_07_120114) do
  create_table "diaries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kigyo_masters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.string "market"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "torihiki_rirekis", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "yakujobi"
    t.string "meigara"
    t.integer "code"
    t.string "market"
    t.string "torihiki"
    t.string "kigen"
    t.string "azukari"
    t.string "kazei"
    t.integer "count"
    t.integer "tanka"
    t.integer "tesuu"
    t.integer "zeigaku"
    t.date "ukewatasi"
    t.integer "kingaku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
