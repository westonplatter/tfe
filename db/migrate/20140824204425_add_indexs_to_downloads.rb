class AddIndexsToDownloads < ActiveRecord::Migration
  def change
  	add_index :downloads, :ip_address
  	add_index :downloads, :country_name
  	add_index :downloads, [:ip_address, :country_name]
  	add_index :downloads, :city
  	add_index :downloads, [:country_name, :city]
  end
end
