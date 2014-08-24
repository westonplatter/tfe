# == Schema Information
#
# Table name: uploads
#
#  id         :integer          not null, primary key
#  filename   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :upload do
    filename "MyString"
  end
end
