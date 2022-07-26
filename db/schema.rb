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

ActiveRecord::Schema[7.0].define(version: 2022_08_06_152726) do
  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_jobs_on_category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_number"
    t.string "client_name"
    t.string "client_phone"
    t.string "string"
    t.integer "worker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.index ["worker_id"], name: "index_orders_on_worker_id"
  end

  create_table "orders_jobs", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_orders_jobs_on_job_id"
    t.index ["order_id"], name: "index_orders_jobs_on_order_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "jobs", "categories"
  add_foreign_key "orders", "workers"
  add_foreign_key "orders_jobs", "jobs"
  add_foreign_key "orders_jobs", "orders"
end
