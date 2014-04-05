FactoryGirl.define do

	factory :role do 
		factory :milk do
			role :milk
		end 

		factory :blood do
			role :blood
		end 

		factory :potential do
			role :potential
		end 
	end

	factory :user do
		first_name = Faker::Name.first_name
		last_name = Faker::Name.last_name
		password = Faker::Internet.password

		first_name { first_name }
		last_name { last_name }
		user_name { first_name + last_name.split(/[.]/).first + rand(0..9).to_s }
		email { Faker::Internet.email(name = first_name) }
		password { password }
		password_confirmation { password }
		nearest_town { Faker::Address.city }
	end

#  => ["id", "user_id", "title", "body", "deleted", "delete_date", "created_at", "updated_at"] 



end