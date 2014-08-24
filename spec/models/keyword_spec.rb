# == Schema Information
#
# Table name: keywords
#
#  id          :integer          not null, primary key
#  age         :integer
#  sex         :string(255)
#  category    :string(255)
#  download_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Keyword, :type => :model do
	it { should belong_to :download }
end
