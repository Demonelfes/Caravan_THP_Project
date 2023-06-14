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

ActiveRecord::Schema[7.0].define(version: 2023_06_13_094804) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "join_van_tags", force: :cascade do |t|
    t.bigint "van_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_join_van_tags_on_tag_id"
    t.index ["van_id"], name: "index_join_van_tags_on_van_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "total_price"
    t.bigint "customer_id"
    t.bigint "van_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["van_id"], name: "index_orders_on_van_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "order_id"
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_reviews_on_order_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "is_admin"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vans", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "city"
    t.string "image_url"
    t.boolean "is_van_pro"
    t.boolean "is_hidden", default: false
    t.string "brand"
    t.string "registration"
    t.boolean "is_manual_transmission"
    t.integer "year"
    t.string "energy"
    t.integer "bed_number"
    t.boolean "has_wc"
    t.boolean "has_fridge"
    t.boolean "has_shower"
    t.integer "price_per_day"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vans_on_user_id"
  end

end
