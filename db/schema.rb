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

ActiveRecord::Schema.define(version: 20160218222202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.string   "cedente"
    t.string   "cedente_doc"
    t.string   "cedente_address"
    t.string   "agencia"
    t.string   "conta_corrente"
    t.string   "variacao"
    t.string   "aceite",          default: "N"
    t.string   "carteira"
    t.string   "convenio"
    t.string   "instrucao_juros"
    t.boolean  "default_bank",    default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "boletos", force: :cascade do |t|
    t.decimal  "amount"
    t.decimal  "discount"
    t.string   "date"
    t.date     "maturity"
    t.string   "doc_number"
    t.integer  "client_id"
    t.boolean  "printed",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "boletos", ["client_id"], name: "index_boletos_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "document"
    t.string   "address"
    t.integer  "ref"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "student"
    t.string   "cpf"
    t.string   "email"
    t.string   "turma"
    t.string   "registro_aluno"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
