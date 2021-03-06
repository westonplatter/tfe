class UploadsController < ApplicationController
	
	def upload
		@count = Download.count
		@uploads = Upload.where(kind: 'p2p').order(:filename)
	end

	def send_upload
		previous_upload = Upload.find_by_filename(file_name)

		if previous_upload.present?
			flash[:notice] = "Already upload this file"	
			redirect_to action: :upload and return 
		end

		Upload.create(filename: file_name, kind: 'p2p')
		Download.que_import_tsv(file_path)
    flash[:notice] = "Successfully uploaded"
    redirect_to action: :upload
	end

	private 
	  def file_path
      params.require(:file).path
	  end

	  def file_name
	  	params.require(:file).original_filename
	  end
end
