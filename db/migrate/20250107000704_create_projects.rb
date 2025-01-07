class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :agency, null: false, foreign_key: true

      t.text    :title
      t.text    :client
      t.boolean :anonymize_client
      t.text    :anonymous_client_name
      t.text    :description
      t.references :industry, null: true, foreign_key: true
      t.text    :outcome
      t.boolean :published, default: false

      t.column :created_at, :timestamptz, null: false
      t.column :updated_at, :timestamptz, null: false
    end
  end
end