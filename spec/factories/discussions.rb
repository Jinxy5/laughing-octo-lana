# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :discussion do
  	name Faker::Lorem.paragraph
  	description Faker::Lorem.paragraph
  end
end
