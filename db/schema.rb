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

ActiveRecord::Schema.define(version: 2019_12_28_171937) do

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.float "base_amount", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_locations", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "location_id", null: false
    t.index "\"locations_id\"", name: "index_categories_locations_on_locations_id"
    t.index ["category_id"], name: "index_categories_locations_on_category_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mtransactions", force: :cascade do |t|
    t.datetime "date", null: false
    t.float "amount", null: false
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_id"
    t.integer "location_id"
    t.index ["account_id"], name: "index_mtransactions_on_account_id"
    t.index ["location_id"], name: "index_mtransactions_on_location_id"
  end

  create_table "transaction_files", force: :cascade do |t|
    t.string "filename", null: false
    t.string "source", null: false
    t.boolean "saved", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_transaction_files_on_account_id"
  end

  create_table "transfer_transactions", force: :cascade do |t|
    t.datetime "date", null: false
    t.float "amount", null: false
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "from_account_id", default: 0, null: false
    t.integer "to_account_id", default: 0, null: false
    t.index ["from_account_id"], name: "index_transfer_transactions_on_from_account_id"
    t.index ["to_account_id"], name: "index_transfer_transactions_on_to_account_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "mtransactions", "accounts"
  add_foreign_key "mtransactions", "locations"
  add_foreign_key "transaction_files", "accounts"
end
