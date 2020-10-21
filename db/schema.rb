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

ActiveRecord::Schema.define(version: 2020_10_20_225047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "code"
    t.string "symbol"
    t.string "name"
    t.string "country"
    t.string "flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.bigint "currency_from_id", null: false
    t.bigint "currency_to_id", null: false
    t.decimal "rate"
    t.decimal "inv_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "update_time"
    t.index ["currency_from_id"], name: "index_exchange_rates_on_currency_from_id"
    t.index ["currency_to_id"], name: "index_exchange_rates_on_currency_to_id"
  end

end
