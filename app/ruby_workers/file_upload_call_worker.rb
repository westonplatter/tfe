# file_upload_call_worker.rb

class FileUploadCallWorker 
	@queue = :tfe_ruby_file
  
  attr_accessor :file
  
  def self.perform(file)
    Call.import_csv(file)
  end
end