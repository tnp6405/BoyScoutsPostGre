# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141115164746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", primary_key: "activity_id", force: true do |t|
    t.integer  "member_id"
    t.datetime "activity_date"
    t.string   "activity_ampm"
    t.string   "activity_type"
    t.integer  "activity_unit_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["member_id"], name: "index_activities_on_member_id", using: :btree

  create_table "members", primary_key: "member_id", force: true do |t|
    t.string   "member_last_name"
    t.string   "member_first_name"
    t.string   "member_cell"
    t.string   "member_landline"
    t.string   "member_email"
    t.boolean  "member_inactive"
    t.string   "member_vehicle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", primary_key: "route_id", force: true do |t|
    t.string   "route_name"
    t.integer  "print_sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runs", primary_key: "run_id", force: true do |t|
    t.integer  "route_id"
    t.integer  "member_id"
    t.datetime "run_date"
    t.integer  "time_taken"
    t.string   "am_pm"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "runs", ["member_id"], name: "index_runs_on_member_id", using: :btree
  add_index "runs", ["route_id"], name: "index_runs_on_route_id", using: :btree

  create_table "subscription_payments", primary_key: "subscription_payment_id", force: true do |t|
    t.integer  "subscription_id"
    t.decimal  "amount_paid"
    t.datetime "date_paid"
    t.datetime "good_till"
    t.boolean  "paypal"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscription_payments", ["subscription_id"], name: "index_subscription_payments_on_subscription_id", using: :btree

  create_table "subscriptions", primary_key: "subscription_id", force: true do |t|
    t.integer  "route_id"
    t.integer  "run_sequence"
    t.string   "number"
    t.string   "street"
    t.integer  "qty"
    t.integer  "qty_comp"
    t.text     "service_notes"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "started_date"
    t.datetime "last_letter_sent_date"
    t.string   "renewal_x0020_grp"
    t.string   "sold_x0020_by"
    t.decimal  "subscription_amount"
    t.string   "maint"
    t.text     "subscription_notes"
    t.datetime "renewal_due_date"
    t.string   "subscription_status"
    t.integer  "alternative_invoice"
    t.datetime "map_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["route_id"], name: "index_subscriptions_on_route_id", using: :btree

end
