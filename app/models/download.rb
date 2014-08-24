class Download < ActiveRecord::Base
	has_many :keywords

	def self.que_import_tsv(file)
		Resque.enqueue(FileUploadWorker, file)
	end
	
	def self.import_tsv(file)
		CSV.foreach(file, {:headers => true, :col_sep => "\t" }) do |row|
      next if row.empty?
      	
      hash = row_to_hash(row)
      create(hash)
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

	def create_keywords 
		words = filename.split(/\s|\./)
		words.each do |w|
			k = Keyword.new

			k.download_id = self.id

			k.word = w

			k.country_name = self.country_name
			
			age = w.gsub(/\D/, '')
			unless age.empty?
				k.age = age.to_i
			end

			sex = w.match(/boy|girl/)
			unless sex.blank?
				case sex.to_s
				when "boy" then k.sex = 'boy'
				when "girl" then k.sex = 'girl'
				end
			end
			
			user_info = username.split('|')
			k.user_category = user_info.first

			k.save
		end
	end
end

# == Schema Information
#
# Table name: downloads
#
#  id             :integer          not null, primary key
#  downloaded_at  :datetime
#  ip_address     :string(255)
#  username       :string(255)
#  filename       :text
#  filesize       :integer
#  internal_ip    :string(255)
#  internal_port  :string(255)
#  city           :string(255)
#  region_code    :string(255)
#  country_code   :string(255)
#  country_name   :string(255)
#  file_extension :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_downloads_on_country_name  (country_name)
#  index_downloads_on_ip_address    (ip_address)
#
