class AddIndexesOnKeywords < ActiveRecord::Migration
  def change
  	add_index :keywords, :word
  	add_index :keywords, :country_name
  	add_index :keywords, :download_id
  end
end
