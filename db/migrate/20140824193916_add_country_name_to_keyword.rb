class AddCountryNameToKeyword < ActiveRecord::Migration
  def change
    add_column :keywords, :country_name, :string
  end
end
