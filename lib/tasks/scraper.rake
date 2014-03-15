namespace :scraper do 
	desc 'scrape'
	task scrape: :environment do
		require 'rubygems' 
		require 'nokogiri'
		require 'open-uri'
		require 'capybara'
		require 'capybara/dsl'

		include Capybara::DSL
		Capybara.current_driver = :selenium
		Capybara.app_host = 'http://stackoverflow.com/'

		def is_image?
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

			if image_extension == 'jpeg' ||
			   image_extension == 'jfif' ||
			   image_extension == 'jpm'  ||
			   image_extension == 'mj2'  ||
			   image_extension == 'tif'  ||
			   image_extension == 'raw'  ||
			   image_extension == 'gif'  ||			   
			   image_extension == 'bmp'  ||			   
			   image_extension == 'png'  ||			   
			   image_extension == 'jxr'  ||			   
			   image_extension == 'webp' ||			   			   
			   image_extension == 'pam'  ||			   
			   image_extension == 'pbm'  ||			   
			   image_extension == 'pgm'  ||			   
			   image_extension == 'ppm'  ||			   
			   image_extension == 'pnm'  			   

     			image_name = generate_file_name(image_url)
				image_content = opended_image.read.to_s

				file_name = image_name + '.' + image_extension

				File.open( local_path + file_name, 'wb') do |out_file|
					out_file.write(image_content)
				end			
					
				puts '\'' + file_name + '\'' + 'saved successfully!'	

			else
				puts 'ERROR: ' + image_url +' does not link to an image! (content-type: ' + content_type + ')'
			end



		end


		save_image('http://i1276.photobucket.com/albums/y462/staffpicks/tumblr_mw4og9rPUL1r01eeeo4_1280.jpg')


=begin


File.open('pie.png', 'wb') do |fo|
  fo.write open("https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSwfwKLjejh1MZKTEy9QtJsS3f0-ZK3URhGnwsaUTXAGbC31oKL").read 
end

image_data = open("https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSwfwKLjejh1MZKTEy9QtJsS3f0-ZK3URhGnwsaUTXAGbC31oKL").read 

puts '*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
puts image_data.inspect
puts '*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
		File.open( path + 'pulled_image.jpg', 'a') do |fa|
			fa.write(open(image['src']).read)
		end
=end

#		out_file = File.new('app/assets/images/pulled_image.jpg', 'a')
#		out_file.puts image['src']
#		out_file.close

#		File.open('file.jpg', 'a') { |file| file.write(image['src']) }

	#	open(image['src']).read
		#puts image

#		sleep 33433
#		input = find_field('gbqfq')
#




#		click_link 'Images'
#		puts '*******'

#		image = first('img.rg_i')	
#		puts image['src']
		
#		variable = first(:xpath, "//img[@class='rg_i']")
		
#		puts variable['src']

#		file << open(variable['src']).read
		
#		variable['src'].should == "url"
#		variable['alt'].should == "text"


#		image = 
#		file << open('http://example.com/image.png').read

#		sleep 232

#		url = 'http://www.walmart.com/ip/George-R.-R.-Martin-s-a-Game-of-Thrones-5-Book-Boxed-Set-Song-of-Ice-and-Fire-Series-A-Game-of-Thrones-a-Clash-of-Kings-a-Storm-of-Swords-a-Feas/20664829'
#		doc = Nokogiri::HTML(open(url))
#		doc.at_css('title').text
	end
end

