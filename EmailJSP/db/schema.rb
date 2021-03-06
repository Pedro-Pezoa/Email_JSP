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

ActiveRecord::Schema.define(version: 20170610233634) do

  create_table "emails", force: :cascade do |t|
    t.integer "user_id"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "imaps_id"
    t.integer "smtps_id"
    t.index ["imaps_id"], name: "index_emails_on_imaps_id"
    t.index ["smtps_id"], name: "index_emails_on_smtps_id"
    t.index ["user_id"], name: "index_emails_on_user_id"
  end

  create_table "imaps", force: :cascade do |t|
    t.string "endereco"
    t.string "porta"
    t.string "autenticacao"
    t.boolean "enable_ssl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smtps", force: :cascade do |t|
    t.string "endereco"
    t.string "porta"
    t.string "autenticacao"
    t.boolean "enable_starttls_auto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
