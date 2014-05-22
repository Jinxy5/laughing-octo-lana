namespace :seeder do

	namespace :initial_seed do

		task page: :environment do
			Page.delete_all
		#	Page.connection.execute('ALTER SEQUENCE pages_seq RESTART WITH 1')
			puts 'deleted and reset pages table'

			page = Page.create(name: 'home')
			puts "created #{page.inspect}"

			Field.delete_all

=begin
Welcome to Blood Bikes Wales
Dear All

Welcome to Blood Bikes Wales' new website and thanks must go to Jonathan Hurley Design for doing such a great job. Thanks also to our volunteers that have worked alongside to help create this site. I'm sure you'll find it easier to navigate and there's a lot more information at your fingertips. It's easier to communicate through our contact buttons as well, ensuring you get the answers you need from the best person to help you. We're continually seeking ways to improve our organisation, be it the service we provide, the way to fund-raise or how we look after our members. Any suggestions you may have are always welcomed.

The last year has seen significant growth in our workload, with three health boards being serviced by us and a fourth health board nearly ready to go live. From the Severn Bridge all the way past Swansea, we are providing a first class service to these health boards. Often our riders comment on how appreciative the healthcare professionals are of the work we do and always sing our praises.

Our aim by the end of the year is to provide our service to all the health boards in Wales. A tall order some may say but between us and our sister group in North Wales I believe we can achieve it. It is because we provide such a valuable and high quality service that we feel it is our moral obligation to serve all our health boards with equal commitment.

For us to provide and maintain this service we need you. Whatever you do for a living, whatever your talents are, whether you ride a bike or not, you are welcome to join us and be part of something really special. So click on the link and email us, take a look at our calendar and come see us, follow us on Facebook and Twitter, keep an eye out for us on the road. Join us.

Andy Walters, Chairman
=end

			field = page.fields.find_or_create_by(name: 'headerone', content: 'Welcome to Blood Bikes Wales', last_updated_by: 'system')
			puts "created #{field.inspect}"

		 	field = page.fields.create(name: 'chairmanmessage', content: "Dear All

Welcome to Blood Bikes Wales' new website and thanks must go to Jonathan Hurley Design for doing such a great job. Thanks also to our volunteers that have worked alongside to help create this site. I'm sure you'll find it easier to navigate and there's a lot more information at your fingertips. It's easier to communicate through our contact buttons as well, ensuring you get the answers you need from the best person to help you. We're continually seeking ways to improve our organisation, be it the service we provide, the way to fund-raise or how we look after our members. Any suggestions you may have are always welcomed.

The last year has seen significant growth in our workload, with three health boards being serviced by us and a fourth health board nearly ready to go live. From the Severn Bridge all the way past Swansea, we are providing a first class service to these health boards. Often our riders comment on how appreciative the healthcare professionals are of the work we do and always sing our praises.

Our aim by the end of the year is to provide our service to all the health boards in Wales. A tall order some may say but between us and our sister group in North Wales I believe we can achieve it. It is because we provide such a valuable and high quality service that we feel it is our moral obligation to serve all our health boards with equal commitment.

For us to provide and maintain this service we need you. Whatever you do for a living, whatever your talents are, whether you ride a bike or not, you are welcome to join us and be part of something really special. So click on the link and email us, take a look at our calendar and come see us, follow us on Facebook and Twitter, keep an eye out for us on the road. Join us.

Andy Walters, Chairman", last_updated_by: 'system')
			puts "created #{field.inspect}"

		end


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