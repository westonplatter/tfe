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
#
