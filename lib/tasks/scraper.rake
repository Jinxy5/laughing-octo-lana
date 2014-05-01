namespace :scraper do 
	desc 'scrape'
	task scrape: :environment do
		require 'rubygems' 
		require 'nokogiri'
		require 'open-uri'
		require 'capybara'
		require 'capybara/dsl'
		require 'anemone'

		include Capybara::DSL
		Capybara.current_driver = :selenium
		Capybara.app_host = 'http://stackoverflow.com/'



		def is_image?(extension)
			if ['jpeg',
				 'jfif',
				 'jpm',  
				 'mj2',  
				 'tif',  
				 'raw',  
				 'gif',  			   
				 'bmp',  			   
				 'png',  			   
				 'jxr',  			   
				 'webp', 			   			   
				 'pam',  			   
				 'pbm',  			   
				 'pgm', 			   
				 'ppm',  			   
				 'pnm'].include? extension
				true
			else
				raise 'not an image'
			end
		end

		def generate_file_name(url)
			File.basename(url, File.extname(url))
		end

		def save_image(url)

			local_path = 'app/assets/images/'

			image_url = url

			opended_image = open(image_url)
			content_type = opended_image.meta['content-type']
			image_extension = content_type.match(/[\w]+$/).to_s;


			begin
				is_image?(image_extension)

	 			image_name = generate_file_name(image_url)
				image_content = opended_image.read.to_s

				file_name = image_name + '.' + image_extension

				File.open( local_path + file_name, 'wb') do |out_file|
					out_file.write(image_content)
				end			
					
				puts '\'' + file_name + '\'' + 'saved successfully!'	

			rescue
				puts 'ERROR: ' + image_url +' does not link to an image! (content-type: ' + content_type + ')'
			end
		end

#		save_image('http://www.thesmallthingsblog.com/')
#    name = doc.at_css("#top h2").text unless doc.at_css("#top h2").nil?	
		Anemone.crawl do |anemone|
			anemone.on_every_page do |page|
				puts page.url
			end 

			anemone.on_pages_like() do |page|
				puts page.url
			end
		end

	end
end

