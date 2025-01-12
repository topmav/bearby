class CreateDoNotSells < ActiveRecord::Migration[8.0]
  def change
    create_table :do_not_sells do |t|
      t.text :first_name, null: false
      t.text :last_name, null: false
      t.text :email, null: false
      t.text :phone

      t.timestamps
    end
  end
end
