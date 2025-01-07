class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.text :name

      # For time zone–aware timestamps in PostgreSQL:
      t.column :created_at, :timestamptz, null: false
      t.column :updated_at, :timestamptz, null: false
    end
  end
end