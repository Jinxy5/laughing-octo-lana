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
		Capybara.app_host = 'http://www.google.com'

		page.visit('/')
		puts page.html 

		input = find_field('gbqfq')


		find(:xpath, "//input[@id='gbqfq']").set "my value"



		click_link 'Images'
		puts '*******'
		puts page.find('img')[0]['src']
		
#		image = 
#		file << open('http://example.com/image.png').read

		sleep 232

#		url = 'http://www.walmart.com/ip/George-R.-R.-Martin-s-a-Game-of-Thrones-5-Book-Boxed-Set-Song-of-Ice-and-Fire-Series-A-Game-of-Thrones-a-Clash-of-Kings-a-Storm-of-Swords-a-Feas/20664829'
#		doc = Nokogiri::HTML(open(url))
#		doc.at_css('title').text
	end
end

