# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :impression do
    ip_address "MyString"
    discussion_id 1
    user_id 1
  end
end
