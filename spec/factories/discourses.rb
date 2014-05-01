# Read about factories at https://github.com/thoughtbot/factory_girl


FactoryGirl.define do
  factory :discourse do
    user_id { 1 }
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    deleted { 0 }
    delete_date { nil }
  end
end
