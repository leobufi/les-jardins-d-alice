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

ActiveRecord::Schema[7.0].define(version: 2024_03_26_133340) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_mes", force: :cascade do |t|
    t.text "description"
    t.string "main_photo"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "about", default: false, null: false
    t.string "selling_points"
    t.index ["user_id"], name: "index_about_mes_on_user_id"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photos_url"
    t.bigint "user_id"
    t.string "main_photo"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "rayon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "main_photo"
    t.index ["rayon_id"], name: "index_categories_on_rayon_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "coffret_on_demands", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents"
    t.string "price_currency", default: "EUR", null: false
    t.string "products"
  end

  create_table "coffrets", force: :cascade do |t|
    t.string "title"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "coffret_products"
    t.string "main_photo"
    t.index ["user_id"], name: "index_coffrets_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "home_cover"
    t.string "jardin_cover"
    t.string "prestation_galery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "home", default: false, null: false
    t.boolean "jardin", default: false, null: false
    t.boolean "prestation", default: false, null: false
    t.boolean "logos", default: false, null: false
    t.string "logos_img"
    t.boolean "coffret_on_demand", default: false, null: false
    t.string "coffret_on_demand_img"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "jardins", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "photos_url"
    t.string "main_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_jardins_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.bigint "coffret_id"
    t.bigint "order_id"
    t.bigint "cart_id"
    t.bigint "product_id"
    t.bigint "coffret_on_demand_id"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["coffret_id"], name: "index_line_items_on_coffret_id"
    t.index ["coffret_on_demand_id"], name: "index_line_items_on_coffret_on_demand_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.boolean "data", default: false, null: false
    t.boolean "check", default: false, null: false
    t.boolean "card", default: false, null: false
    t.string "payment_method"
    t.string "phone_number"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "prestation_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.bigint "user_id"
    t.text "description"
    t.string "main_photo"
    t.string "photos"
    t.index ["user_id"], name: "index_prestation_categories_on_user_id"
  end

  create_table "prestations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "dates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "main_photo"
    t.string "photos_url"
    t.bigint "prestation_category_id"
    t.index ["prestation_category_id"], name: "index_prestations_on_prestation_category_id"
    t.index ["user_id"], name: "index_prestations_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "quantity"
    t.string "origin"
    t.string "photos_url"
    t.string "main_photo"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "coffret_id"
    t.integer "discount"
    t.bigint "coffret_on_demand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["coffret_id"], name: "index_products_on_coffret_id"
    t.index ["coffret_on_demand_id"], name: "index_products_on_coffret_on_demand_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "rayons", force: :cascade do |t|
    t.string "title"
    t.text "selling_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_rayons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "about_mes", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "rayons"
  add_foreign_key "line_items", "coffrets"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "prestations", "prestation_categories"
  add_foreign_key "products", "categories"
end
