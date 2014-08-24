class Download < ActiveRecord::Base

	def self.que_import_tsv(file)
		Resque.enqueue(FileUploadWorker, file)
	end
	
	def self.import_tsv(file)
		CSV.foreach(file, {:headers => true, :col_sep => "\t" }) do |row|
      next if row.empty?
      
      hash = row_to_hash(row)
      download = where(username: hash[:username], downloaded_at: hash[:downloaded_at]).first
      create(hash) if download.nil?
    end
	end

	def self.row_to_hash(row)
		{
			downloaded_at: row["DateTime"], 
			ip_address: row["IPAddress"], 
			username: row["Username"], 
			filename: row["FileName"], 
			filesize: row["FileSize"], 
			internal_ip: row["InternalIP"], 
			internal_port: row["InternalPort"], 
			city: row["City"], 
			region_code: row["RegionCode"], 
			country_code: row["CountryCode"], 
			country_name: row["CountryName"], 
			file_extension: row["File Extension"]
		}
	end

end