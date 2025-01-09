class AddDescriptionAndSvgToServices < ActiveRecord::Migration[8.0]
  def change
    add_column :services, :description, :text
    add_column :services, :svg_text, :text
  end
end
