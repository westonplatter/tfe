# == Schema Information
#
# Table name: uploads
#
#  id         :integer          not null, primary key
#  filename   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Upload < ActiveRecord::Base
end
