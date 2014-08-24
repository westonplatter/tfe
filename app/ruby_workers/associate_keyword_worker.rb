# associate_keyword_worker.rb

class AssociateKeywordWorker
	@queue = :tfe_ruby_keyword

	attr_accessor :download_id

	def self.perform(download_id)
		d = Download.find(download_id)
		d.create_keywords
	end
end