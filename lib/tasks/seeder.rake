namespace :db do 
	namespace :seed do
		desc 'create causes'
		task cause: :environment do
			Cause.delete_all

			20.times do |count|
				if Cause.create(title: Faker::Lorem.sentence(word_count = 5), content: Faker::Lorem.sentence(sentence_count = 500), image_path: 'testie', amount_requested: amount_requested = rand(1..5000) , amount_donated: rand(2..amount_requested))
					puts 'success'
				end
			end
		end	

		desc 'create events'
		task recital: :environment do
			Recital.delete_all

			20.times do |count|
				if Recital.create(title: Faker::Lorem.sentence(word_count = 5), content: Faker::Lorem.sentence(sentence_count = 500), image_path: 'testie')
					puts 'success'
				end
			end
		end	

		desc 'create events'
		task event: :environment do
			Event.delete_all

			20.times do |count|
				if Event.create(startdate: DateTime.now, enddate: DateTime.now, title: Faker::Lorem.sentence(word_count = 5), content: Faker::Lorem.sentence(sentence_count = 500), image_path: 'testie')
					puts 'success'
				end
			end
		end
	end
end