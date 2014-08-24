class CallController < ApplicationController
  def upload
  	@count = Call.count
		@uploads = Upload.where(kind: 'call').order(:filename)
  end

  def send_upload
  	previous_upload = Upload.find_by_filename(file_name)

		if previous_upload.present?
			flash[:notice] = "Already upload this file"	
			redirect_to action: :upload and return 
		end

		Upload.create(filename: file_name, kind: 'call')
		Call.que_import_csv(file_path)
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
