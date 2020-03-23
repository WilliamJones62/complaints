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

ActiveRecord::Schema.define(version: 20200113213223) do

  create_table "complaint_images", force: :cascade do |t|
    t.integer "complaint_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.string "user"
    t.string "invoice"
    t.string "part"
    t.integer "part_count"
    t.date "issue_date"
    t.string "issue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "issue2"
    t.string "image"
    t.text "notes"
    t.string "lot"
    t.string "order"
    t.string "status"
    t.boolean "with_vendor"
  end

  create_table "employee_lists", force: :cascade do |t|
    t.string "Employee_Status"
    t.string "Badge_"
    t.string "Cost_Center_Code"
    t.string "Department"
    t.string "Lastname"
    t.string "Firstname"
    t.date "Hire_Date"
    t.date "Termination_Date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Badge_No"
    t.string "Employee_Name"
  end

  create_table "invitems", force: :cascade do |t|
    t.string "invoice_numb"
    t.string "order_numb"
    t.string "part_code"
    t.string "lot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partmstrs", force: :cascade do |t|
    t.string "part_code"
    t.string "part_desc"
    t.string "part_grp"
    t.string "uom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
