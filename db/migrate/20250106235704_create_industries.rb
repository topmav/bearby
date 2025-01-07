class CreateIndustries < ActiveRecord::Migration[7.0]
  def change
    create_table :industries do |t|
      t.text :name

      t.column :created_at, :timestamptz, null: false
      t.column :updated_at, :timestamptz, null: false
    end
  end
end