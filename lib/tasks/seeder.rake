namespace :seeder do

	namespace :initial_seed do

		task page: :environment do
		#	Page.delete_all
		#	Page.connection.execute('ALTER SEQUENCE pages_seq RESTART WITH 1')
		#	puts 'deleted and reset pages table'

			page = Page.find_or_create_by(name: 'home')
			puts "created #{page.inspect}"

	#		Field.delete_all

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





			##############
			page = Page.find_or_create_by(name: 'about')
			puts "created #{page.inspect}"

		#	Field.delete_all

			field = page.fields.find_or_create_by(name: 'title', content: 'About Blood Bikes Wales', last_updated_by: 'system')
			puts "created #{field.inspect}"

		 	field = page.fields.create(name: 'description', content: "We are an enthusiastic group of people keen to make a difference. Most of us are riders and we aim to use our skills, time and enthusiasm to help the Health Service in Wales.
The NHS uses its own transportation system to move blood supplies, plasma, documents and other items between hospitals during the day on Mondays to Fridays. Between 7pm and 7am on weekdays, on weekends and on bank holidays, the regular system used to stop and the NHS used the police, the ambulance service, taxis and couriers to carry the vital supplies. You can imagine what this used to cost the NHS. This is where Blood Bikes Wales comes in. Our volunteers provide the NHS with out-of-hours transport thus saving substantial sums which can be put to better use. Based on figures from our fellow Blood Bike groups in England, we estimate that for each pound we receive, the NHS will save at least five pounds.
We currently give our services free of charge between 7pm on Friday evening until midnight on Monday morning and over bank holidays to:
Abertawe Bro Morgannwg University Health Board (Swansea),
Cwm Taf University Health Board (Merthyr Tydfil, Llantrisant) and Aneurin Bevan University Health Board (Newport, Caerphilly, Monmouthshire) ... and we talking to the other health boards in Wales. Blood Bikes Wales is a member of the Nationwide Association of Blood Bikes which shares our quest to provide a reliable, good value and high quality service to health institutions throughout the country.
Our meetings are held at Carmarthen, Pontyclun and Cwmbran. Details are posted on our Facebook page. Please come along: to meet us and find out more about how we operate.
Further news and updates can be found by clicking on the news link in the menu bar!", last_updated_by: 'system')

			puts "created #{field.inspect}"
			###############


			##############
			page = Page.find_or_create_by(name: 'news')
			puts "created #{page.inspect}"

		#	Field.delete_all

			field = page.fields.find_or_create_by(name: 'title', content: 'Latest News', last_updated_by: 'system')

			puts "created #{field.inspect}"
			###############



			##############
			page = Page.find_or_create_by(name: 'Fundraising')
			puts "created #{page.inspect}"

		#	Field.delete_all

			field = page.fields.find_or_create_by(name: 'title', content: 'Fundraising', last_updated_by: 'system')
			puts "created #{field.inspect}"

		 	field = page.fields.create(name: 'description', content: "Fundraising is the lifeblood of any charity and it is no less so for Blood Bikes Wales. We have a dedicated enthusiastic team who all try and do as much fundraising as they are able to do.

Most of our members work on a full-time basis and give up some of their spare time in the interest of a worthwhile charity that is intent on making a difference.

We are very proud of our members and grateful for all their hard work.

There is normally a fundraising event on at least once a week (please see the check our Facebook Page for details).

The supermarkets have been very generous in allowing us to collect at their stores and the customers of these stores are very generous and inquisitive about our cause.

We have support from a number of people and companies, details of which will follow in future updates.

Poundstretcher donates £23,750 to Blood Bikes Wales
It is with great pleasure, and not a little surprise, that we announce a donation to Blood Bikes Wales from Poundstretcher Limited.

Poundstretcher have over 400 stores in the UK, of which 36 are in Wales, and it is to these 36 Welsh stores and their customers that we are endebted, because Poundstretcher decided that they liked our cause so much, they would donate the procedes of carrier bag sales in Wales to us.

We're not talking a small sum here though. Five pence per bag is a small amount, but over those 36 stores the total soon rises. We are extremely grateful to have received a cheque from Poundstretcher for £23,750.98. That is no misprint - the figure is correct: twenty-three thousand, seven hundred and fifty pounds and 98p!

We, the members of Blood Bikes Wales, extend our utmost gratitude to Poundstretcher, their staff across the whole of the UK, in Wales and in their head office in Huddersfield and to their customers across the Principality.", last_updated_by: 'system')

			#puts "created #{field.inspect}"
			###############
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