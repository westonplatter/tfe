class FileUploadWorker
	@queue = :tfe_ruby_file
  
  attr_accessor :file
  
  def self.perform(file)
    Download.import_tsv(file)
  end

end