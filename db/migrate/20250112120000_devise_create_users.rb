class DeviseCreateUsers < ActiveRecord::Migration[8.0]
    def change
      create_table :users do |t|
        # Devise default fields
        t.text :email,              null: false, default: ""
        t.text :encrypted_password, null: false, default: ""
  
        # Recoverable
        t.text   :reset_password_token
        t.column :reset_password_sent_at, :timestamptz
  
        # Custom fields
        t.references :agency, foreign_key: { to_table: :agencies }
        t.boolean :is_active, null: false, default: true
        t.text    :name
        t.boolean :admin, null: false, default: false
  
        t.timestamps null: false
      end
  
      # Indexes for quick lookups
      add_index :users, :email, unique: true
      add_index :users, :reset_password_token, unique: true
    end
  end