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

ActiveRecord::Schema[8.0].define(version: 2025_01_12_180059) do
  create_schema "auth"
  create_schema "cable"
  create_schema "cache"
  create_schema "extensions"
  create_schema "graphql"
  create_schema "graphql_public"
  create_schema "pgbouncer"
  create_schema "pgsodium"
  create_schema "pgsodium_masks"
  create_schema "queue"
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

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
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
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.index ["uuid"], name: "index_agencies_on_uuid", unique: true
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

  create_table "do_not_sells", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.text "email", null: false
    t.text "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.text "name"
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false
    t.text "description"
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
    t.text "description"
    t.text "svg_text"
  end

  create_table "users", force: :cascade do |t|
    t.text "email", default: "", null: false
    t.text "encrypted_password", default: "", null: false
    t.text "reset_password_token"
    t.timestamptz "reset_password_sent_at"
    t.bigint "agency_id"
    t.boolean "is_active", default: true, null: false
    t.text "name"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_users_on_agency_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agency_services", "agencies"
  add_foreign_key "agency_services", "services"
  add_foreign_key "project_services", "projects"
  add_foreign_key "project_services", "services"
  add_foreign_key "projects", "agencies"
  add_foreign_key "projects", "industries"
  add_foreign_key "users", "agencies"
end
