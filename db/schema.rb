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

ActiveRecord::Schema.define(version: 20190827155810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comedians", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_url", default: "https://comps.gograph.com/ggb/66561281"
    t.index ["age"], name: "index_comedians_on_age"
  end

  create_table "specials", force: :cascade do |t|
    t.string "name"
    t.integer "runtime"
    t.bigint "comedian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comedian_id"], name: "index_specials_on_comedian_id"
  end

  add_foreign_key "specials", "comedians"
end
