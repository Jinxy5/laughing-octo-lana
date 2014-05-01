namespace :seeder do

	namespace :initial_seed do

		task roles: :environment do

			Role.delete_all
			Role.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')

			roles = ['potential', 'admin', 'rider', 'midweek', 'coordinator']


			roles.each_with_index do |role, index|
				Role.create(role: role)
			end

		end

		task forums: :environment do

			Forum.delete_all
			Forum.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')

			forums = [{name: 'Rider', description: 'talk about matters concerning being a rider', role: 'rider' }, 
					  {name: 'Midweek', description: 'talk about matters concerning being a midweeker', role: 'midweek' },  
					  {name: 'Admin', description: 'talk about matters concerning being an admin', role: 'admin' }, 
					  {name: 'Coordinator', description: 'talk about being a coordinator', role: 'coordinator' }]

			forums.each do |forum|

				Forum.create( name: forum[:name], description: forum[:description] )
				
				forum_instance = Forum.last
				forum_instance.allow_role( forum[:role] )

			end
		end
	end

	namespace :development do

		task user_roles: :environment do
			
#			roles = ['potential', 'admin', 'rider', 'midweek', 'coordinator']

			puts '==================================='

			puts 'Created: '

				3.times do

					user = User.create(user_name: Faker::Name.first_name, email: Faker::Internet.email, password: 'awesomepassword', password_confirmation: 'awesomepassword' )

					user.make_coordinator!
				
			end

			puts '==================================='

		end
		
	
	end

	namespace :demo_seed do
		desc 'create users' 
		task user: :environment do
			User.delete_all
			User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')

			100.times do |count|
				if user = User.create(user_name: Faker::Name.first_name, email: Faker::Internet.email, password: 'awesomepassword', password_confirmation: 'awesomepassword' )
					
					user.make_coordinator!

					puts 'Successfully created '
				end
			end
		end

		desc 'create discussions' 
		task discussion: :environment do
			Discussion.delete_all
			Discussion.connection.execute('ALTER SEQUENCE discussions_id_seq RESTART WITH 1')

			20.times do |count|
				if Discussion.create(name: Faker::Lorem.sentence(word_count = 20), forum_id: rand(0..3), user_id: rand(0..99), body: Faker::Lorem.sentence(characters = 200) )
					puts 'Successfully created '
				end
			end
		end

		desc 'seed all tables'
		task all: ['cause', 'recital', 'event']
		desc 'create causes'
		task cause: :environment do
			Cause.delete_all

			10.times do |count|
				if Cause.create(title: Faker::Lorem.sentence(word_count = 20), content: Faker::Lorem.sentence(characters = 500),image_path: (rand(1..10).to_s + '.jpg'), amount_requested: amount_requested = rand(1..5000) , amount_donated: rand(2..amount_requested))
					puts 'success'
				end
			end
		end	

		desc 'create events'
		task recital: :environment do
			Recital.delete_all

			10.times do |count|
				if Recital.create(title: Faker::Lorem.sentence(word_count = 20), content: Faker::Lorem.sentence(characters = 500),image_path: (rand(1..10).to_s + '.jpg'))
					puts 'success'
				end
			end
		end	

		desc 'create events'
		task event: :environment do
			Event.delete_all

			10.times do |count|
				if Event.create(startdate: DateTime.now, enddate: DateTime.now, title: Faker::Lorem.sentence(characters = 20), content: Faker::Lorem.sentence(sentence_count = 500),image_path: (rand(1..10).to_s + '.jpg'))
					puts 'success'
				end
			end
		end
	end

	namespace :true_seed do
	end
end