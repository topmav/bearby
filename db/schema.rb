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

ActiveRecord::Schema[8.0].define(version: 2025_01_07_042456) do
  create_schema "auth"
  create_schema "extensions"
  create_schema "graphql"
  create_schema "graphql_public"
  create_schema "pgbouncer"
  create_schema "pgsodium"
  create_schema "pgsodium_masks"
  create_schema "realtime"
  create_schema "storage"
  create_schema "vault"

  # These are extensions that must be enabled in order to support this database
  enable_extension "extensions.pg_stat_statements"
  enable_extension "extensions.pgcrypto"
  enable_extension "extensions.pgjwt"
  enable_extension "extensions.uuid-ossp"
  enable_extension "graphql.pg_graphql"
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgsodium.pgsodium"
  enable_extension "vault.supabase_vault"

  create_table "agencies", force: :cascade do |t|
    t.text "name", null: false
    t.text "address"
    t.text "city"
    t.text "state"
    t.text "zip_code"
    t.text "company_size"
    t.boolean "in_business", default: true
    t.boolean "full_service_agency"
    t.text "phone"
    t.text "website"
    t.text "description"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "long", precision: 10, scale: 6
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false
  end

  create_table "agency_services", force: :cascade do |t|
    t.bigint "agency_id", null: false
    t.bigint "service_id", null: false
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false
    t.index ["agency_id", "service_id"], name: "index_agency_services_on_agency_id_and_service_id", unique: true
    t.index ["agency_id"], name: "index_agency_services_on_agency_id"
    t.index ["service_id"], name: "index_agency_services_on_service_id"
  end

  create_table "industries", force: :cascade do |t|
    t.text "name"
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false
  end

  create_table "project_services", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "service_id", null: false
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false
    t.index ["project_id", "service_id"], name: "index_project_services_on_project_id_and_service_id", unique: true
    t.index ["project_id"], name: "index_project_services_on_project_id"
    t.index ["service_id"], name: "index_project_services_on_service_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "agency_id", null: false
    t.text "title"
    t.text "client"
    t.boolean "anonymize_client"
    t.text "anonymous_client_name"
    t.text "description"
    t.bigint "industry_id"
    t.text "outcome"
    t.boolean "published", default: false
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false
    t.index ["agency_id"], name: "index_projects_on_agency_id"
    t.index ["industry_id"], name: "index_projects_on_industry_id"
  end

  create_table "services", force: :cascade do |t|
    t.text "name"
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false
  end

  add_foreign_key "agency_services", "agencies"
  add_foreign_key "agency_services", "services"
  add_foreign_key "project_services", "projects"
  add_foreign_key "project_services", "services"
  add_foreign_key "projects", "agencies"
  add_foreign_key "projects", "industries"
end
