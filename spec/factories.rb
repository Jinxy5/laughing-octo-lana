FactoryGirl.define do
	factory :user do
		first_name = Faker::Name.first_name
		password = Faker::Internet.password

		user_name(first_name)
		email(Faker::Internet.email(name = first_name))
		password password
		password_confirmation password
	end
end