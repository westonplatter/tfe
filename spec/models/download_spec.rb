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

require 'rails_helper'

RSpec.describe Download, :type => :model do
	it { should have_many :keywords }
end
