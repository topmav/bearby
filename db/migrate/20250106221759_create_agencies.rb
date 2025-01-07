class CreateAgencies < ActiveRecord::Migration[7.0]
  def change
    create_table :agencies do |t|
      t.text  :name, null: false                
      t.text  :address
      t.text  :city
      t.text  :state
      t.text  :zip_code
      t.text :company_size                    # enum
      t.boolean :in_business, default: true
      t.boolean :full_service_agency
      t.text  :phone, limit: 10                # Exactly 10 digits, stored as plain text
      t.text  :website
      t.text    :description
      t.decimal :lat, precision: 10, scale: 6    
      t.decimal :long, precision: 10, scale: 6   

      t.column :created_at, :timestamptz, null: false
      t.column :updated_at, :timestamptz, null: false
    end
  end
end