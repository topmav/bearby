# db/migrate/20250107012345_create_project_services.rb
class CreateProjectServices < ActiveRecord::Migration[7.0]
  def change
    create_table :project_services do |t|
      t.references :project, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.column :created_at, :timestamptz, null: false
      t.column :updated_at, :timestamptz, null: false
    end

    # Make the project_id/service_id combo unique if you wish to prevent duplicates
    add_index :project_services, [:project_id, :service_id], unique: true
  end
end