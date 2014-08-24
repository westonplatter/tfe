# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :call do
    call_time ""
    number "MyString"
    label "MyString"
    from_city "MyString"
    from_state "MyString"
    minutes "9.99"
  end
end
