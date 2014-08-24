class Call < ActiveRecord::Base

	def self.que_import_csv(file)
		Resque.enqueue(FileUploadCallWorker, file)
	end

	def self.import_csv(file)
		CSV.foreach(file, {:headers => true, :col_sep => "," }) do |row|
      next if row.empty?
      	
      hash = row_to_hash(row)
      create(hash)
    end		
	end

	def self.row_to_hash(row)
		datetime = DateTime.strptime(row["Pacific Time"], '%m/%d/%Y %H:%M')
		{
			call_time: datetime, 
			number: row["Number"], 
			label: row["Label"], 
			from_city: row["From City"], 
			from_state: row["From State"], 
			minutes: row["Minutes"].to_d
		}
	end
end

# == Schema Information
#
# Table name: calls
#
#  id         :integer          not null, primary key
#  call_time  :datetime
#  number     :string(255)
#  label      :string(255)
#  from_city  :string(255)
#  from_state :string(255)
#  minutes    :decimal(10, 4)
#  created_at :datetime
#  updated_at :datetime
#
