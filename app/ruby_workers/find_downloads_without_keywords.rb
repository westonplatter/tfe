# find_downloads_without_keywords.rb

class FindDownloadsWithoutKeywords
	@queue = :tfe_ruby_keyword

	def self.perform

		Download.find_by_sql("select * from downloads where not exists (select * from keywords where keywords.download_id = downloads.id)").each do |download|
			Resque.enqueue(AssociateKeywordWorker, download.id)
		end

	end
end