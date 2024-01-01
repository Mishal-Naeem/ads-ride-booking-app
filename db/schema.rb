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

ActiveRecord::Schema.define(version: 2024_01_01_114152) do

  create_table "conversations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "readStatus", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body", null: false
    t.integer "sender_id", null: false
    t.integer "conversation_id", null: false
    t.integer "reciever_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["reciever_id"], name: "index_messages_on_reciever_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "content"
    t.boolean "is_read"
    t.string "notifiable_type", null: false
    t.integer "notifiable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.integer "payment_type", default: 0, null: false
    t.integer "user_id", null: false
    t.integer "ride_request_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ride_request_id"], name: "index_payment_methods_on_ride_request_id", unique: true
    t.index ["user_id"], name: "index_payment_methods_on_user_id"
  end

  create_table "promo_codes", force: :cascade do |t|
    t.string "code", default: "", null: false
    t.decimal "usage_limit", default: "0.0", null: false
    t.datetime "expiry_date", default: "2023-12-31 13:23:20", null: false
    t.decimal "discount", default: "0.0", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.index ["user_id"], name: "index_promo_codes_on_user_id"
  end

  create_table "push_notifications", force: :cascade do |t|
    t.text "content"
    t.string "other_attributes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "refunds", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "transaction_id", null: false
    t.decimal "amount", default: "0.0", null: false
    t.string "reason", default: "", null: false
    t.integer "status", default: 0, null: false
    t.datetime "request_date", default: "2023-12-31 20:20:35", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transaction_id"], name: "index_refunds_on_transaction_id", unique: true
    t.index ["user_id"], name: "index_refunds_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "reviewer_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "ride_requests", force: :cascade do |t|
    t.string "source", default: "", null: false
    t.string "destination", default: "", null: false
    t.integer "ride_type", default: 0, null: false
    t.decimal "estimated_amount", default: "0.0", null: false
    t.integer "status", default: 0, null: false
    t.datetime "datetime", default: "2023-12-31 13:51:04", null: false
    t.integer "user_id", null: false
    t.integer "promo_code_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["promo_code_id"], name: "index_ride_requests_on_promo_code_id"
    t.index ["user_id"], name: "index_ride_requests_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "trasaction_date_and_time"
    t.integer "status", default: 0, null: false
    t.string "stripe_charge_id"
    t.decimal "amount", default: "0.0", null: false
    t.integer "driver_id", null: false
    t.integer "passenger_id", null: false
    t.integer "trip_id", null: false
    t.integer "payment_method_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_transactions_on_driver_id"
    t.index ["passenger_id"], name: "index_transactions_on_passenger_id"
    t.index ["payment_method_id"], name: "index_transactions_on_payment_method_id"
    t.index ["trip_id"], name: "index_transactions_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.decimal "distance", default: "0.0", null: false
    t.datetime "start_time", default: "2023-12-31 13:50:49", null: false
    t.integer "status", default: 0, null: false
    t.datetime "end_time", default: "2023-12-31 14:50:49", null: false
    t.decimal "amount", default: "0.0", null: false
    t.decimal "discounted_amount", default: "0.0", null: false
    t.integer "driver_id", null: false
    t.integer "passenger_id", null: false
    t.integer "vehicle_id", null: false
    t.integer "ride_request_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_trips_on_driver_id"
    t.index ["passenger_id"], name: "index_trips_on_passenger_id"
    t.index ["ride_request_id"], name: "index_trips_on_ride_request_id", unique: true
    t.index ["vehicle_id"], name: "index_trips_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "address", default: "", null: false
    t.string "phn_num", default: "", null: false
    t.string "city", default: "", null: false
    t.string "password", default: "", null: false
    t.string "type", default: "passenger", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "engine_size", default: "", null: false
    t.integer "seating_capacity", default: 1, null: false
    t.string "description", default: "", null: false
    t.string "fuel_type", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "VIN_NUM", default: "", null: false
    t.string "color", default: "", null: false
    t.string "plate_num", default: "", null: false
    t.string "model", default: "", null: false
    t.string "brand", default: "", null: false
    t.integer "year", default: 0, null: false
    t.boolean "is_available", default: false, null: false
    t.integer "vehicle_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
    t.index ["vehicle_type_id"], name: "index_vehicles_on_vehicle_type_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "balance", null: false
    t.string "currency", default: "PKR", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "conversations", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "recievers"
  add_foreign_key "messages", "senders"
  add_foreign_key "notifications", "users"
  add_foreign_key "payment_methods", "ride_requests"
  add_foreign_key "payment_methods", "users"
  add_foreign_key "promo_codes", "users"
  add_foreign_key "refunds", "transactions"
  add_foreign_key "refunds", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "ride_requests", "promo_codes"
  add_foreign_key "ride_requests", "users"
  add_foreign_key "transactions", "payment_methods"
  add_foreign_key "transactions", "trips"
  add_foreign_key "transactions", "users", column: "driver_id"
  add_foreign_key "transactions", "users", column: "passenger_id"
  add_foreign_key "trips", "ride_requests"
  add_foreign_key "trips", "users", column: "driver_id"
  add_foreign_key "trips", "users", column: "passenger_id"
  add_foreign_key "trips", "vehicles"
  add_foreign_key "vehicles", "users"
  add_foreign_key "vehicles", "vehicle_types"
  add_foreign_key "wallets", "users"
end
