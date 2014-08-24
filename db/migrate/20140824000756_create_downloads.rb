class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
    	
    	t.datetime :downloaded_at
    	t.string :ip_address
    	t.string :username
    	t.text :filename
    	t.integer :filesize
    	t.string :internal_ip
    	t.string :internal_port
    	t.string :city
    	t.string :region_code
    	t.string :country_code
    	t.string :country_name
    	t.string :file_extension

      t.timestamps
    end
  end
end
