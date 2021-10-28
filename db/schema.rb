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

ActiveRecord::Schema.define(version: 2021_10_28_163659) do

  create_table "activities", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "id"
    t.integer "primary_key"
    t.string "title"
    t.boolean "drop_in"
    t.boolean "indoor"
    t.boolean "outdoor"
    t.boolean "online"
    t.string "about"
    t.boolean "purchasable"
    t.integer "available_spots"
    t.integer "start_months_old"
    t.integer "end_months_old"
    t.string "instructions"
    t.boolean "camp"
    t.boolean "date_night"
    t.boolean "day_pass"
    t.boolean "drop_off"
    t.boolean "allows_waitlist"
    t.boolean "only_purchasable_as_trial"
    t.string "unique_product_id"
    t.string "currency"
    t.string "link"
    t.string "online_link"
    t.integer "updated"
    t.integer "schedule_id"
    t.integer "price_integer"
    t.string "price"
    t.string "web_url"
    t.boolean "for_kids"
    t.integer "start_time"
    t.integer "end_time"
    t.string "start_time_iso_string"
    t.string "end_time_iso_string"
    t.integer "purchasable_start_time"
    t.integer "purchasable_end_time"
    t.text "instructors"
    t.text "discounts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_activities_on_event_id"
  end

  create_table "data", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "page"
    t.integer "total"
    t.boolean "last_page"
    t.text "notification"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "activities", "events"
end
