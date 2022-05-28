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

ActiveRecord::Schema[7.0].define(version: 2022_04_30_225251) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "page_profiles", force: :cascade do |t|
    t.string "display_name"
    t.string "location"
    t.text "description"
    t.string "profile_image"
    t.string "header_image"
    t.bigint "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_page_profiles_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "slug", limit: 24
    t.boolean "published", default: false
    t.string "lock_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  add_foreign_key "page_profiles", "pages"
end
