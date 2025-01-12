class AddUuidToAgencies < ActiveRecord::Migration[8.0]
  def change
    # Enable pgcrypto extension for UUID support
    enable_extension 'pgcrypto'

    # Add UUID column with a default value
    add_column :agencies, :uuid, :uuid, null: false, default: 'gen_random_uuid()'

    # Add unique index on UUID
    add_index :agencies, :uuid, unique: true
  end
end
