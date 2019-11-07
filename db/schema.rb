# typed: false
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

ActiveRecord::Schema.define(version: 2019_11_07_111942) do

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_mtransactions", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "mtransaction_id", null: false
    t.index "\"mtransactions_id\"", name: "index_categories_mtransactions_on_mtransactions_id"
    t.index ["category_id"], name: "index_categories_mtransactions_on_category_id"
  end

  create_table "mtransactions", force: :cascade do |t|
    t.datetime "date", null: false
    t.float "amount", null: false
    t.string "place", null: false
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_mtransactions_on_account_id"
  end

  create_table "transaction_files", force: :cascade do |t|
    t.string "filename", null: false
    t.string "source", null: false
    t.boolean "save", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "mtransactions", "accounts"
end
