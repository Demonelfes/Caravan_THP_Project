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

ActiveRecord::Schema[7.0].define(version: 2023_06_13_094822) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "historics", force: :cascade do |t|
    t.integer "van_manual_van_id"
    t.string "van_title"
    t.text "van_description"
    t.string "van_city"
    t.float "van_latitude"
    t.float "van_longitude"
    t.string "van_brand"
    t.boolean "van_is_manual_transmission"
    t.integer "van_year"
    t.string "van_energy"
    t.integer "van_bed_number"
    t.boolean "van_is_wc"
    t.boolean "van_is_fridge"
    t.boolean "van_is_shower"
    t.integer "van_price_per_day"
    t.bigint "van_user_id"
    t.string "owner_email"
    t.boolean "owner_is_admin"
    t.string "customer_email"
    t.boolean "customer_is_admin"
    t.integer "order_id"
    t.datetime "order_created_at"
    t.integer "order_cart_id"
    t.datetime "order_cart_start_date"
    t.datetime "order_cart_end_date"
    t.integer "order_cart_price"
    t.index ["van_user_id"], name: "index_historics_on_van_user_id"
  end

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
    t.bigint "owner_id"
    t.bigint "van_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["owner_id"], name: "index_orders_on_owner_id"
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
    t.integer "manual_van_id"
    t.string "title"
    t.text "description"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "image_url"
    t.string "brand"
    t.boolean "is_manual_transmission"
    t.integer "year"
    t.string "energy"
    t.integer "bed_number"
    t.boolean "is_wc"
    t.boolean "is_fridge"
    t.boolean "is_shower"
    t.integer "price_per_day"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vans_on_user_id"
  end

end
