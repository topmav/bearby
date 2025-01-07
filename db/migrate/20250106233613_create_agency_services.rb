class CreateAgencyServices < ActiveRecord::Migration[7.0]
  def change
    create_table :agency_services do |t|
      t.references :agency, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.column :created_at, :timestamptz, null: false
      t.column :updated_at, :timestamptz, null: false
    end

    add_index :agency_services, [:agency_id, :service_id], unique: true
  end
end