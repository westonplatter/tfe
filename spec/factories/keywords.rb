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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keyword do
    age 1
    sex "MyString"
    category "MyString"
  end
end
