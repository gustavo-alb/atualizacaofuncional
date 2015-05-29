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

ActiveRecord::Schema.define(version: 20150528124636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administracao_ambientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administracao_carga_horarias", force: :cascade do |t|
    t.integer  "carga_horaria"
    t.string   "nome"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "administracao_cargos", force: :cascade do |t|
    t.string   "nome"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administracao_classes", force: :cascade do |t|
    t.string   "nome"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administracao_concursos", force: :cascade do |t|
    t.string   "nome"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administracao_disciplinas", force: :cascade do |t|
    t.string   "nome"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administracao_locais", force: :cascade do |t|
    t.string   "nome"
    t.string   "codigo"
    t.integer  "tipo"
    t.integer  "local_pai_id"
    t.integer  "municipio_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "administracao_quadros", force: :cascade do |t|
    t.string   "nome"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administracao_situacoes", force: :cascade do |t|
    t.string   "nome"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "cadastro"
    t.string   "componente_curricular"
    t.string   "documento_movimentacao"
    t.integer  "carga_horaria_id"
    t.integer  "classe_id"
    t.integer  "ambiente_id"
    t.integer  "cargo_id"
    t.integer  "lotacao_id"
    t.integer  "quadro_id"
    t.integer  "concurso_id"
    t.integer  "municipio_opcao_id"
    t.integer  "situacao_id"
    t.integer  "usuario_id"
    t.integer  "disciplina_concurso_id"
    t.integer  "disciplina_atuacao_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "municipios", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.string   "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "cpf"
    t.string   "nome"
    t.integer  "grupo"
    t.boolean  "mudar_senha",            default: false
    t.string   "login"
    t.integer  "lotacao_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
