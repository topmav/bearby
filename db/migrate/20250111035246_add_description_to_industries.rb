class AddDescriptionToIndustries < ActiveRecord::Migration[8.0]
  def change
    add_column :industries, :description, :text
  end
end
