class Keyword < ActiveRecord::Base
	belongs_to :download
end

# == Schema Information
#
# Table name: keywords
#
#  id            :integer          not null, primary key
#  age           :integer
#  sex           :string(255)
#  user_category :string(255)
#  download_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#  word          :string(255)
#  country_name  :string(255)
#
# Indexes
#
#  index_keywords_on_country_name  (country_name)
#  index_keywords_on_download_id   (download_id)
#  index_keywords_on_word          (word)
#
