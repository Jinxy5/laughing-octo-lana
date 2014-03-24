require 'rubygems'

#require 'spork'

#Spork.prefork do

  Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

  #Dir["./spec/support/**/*.rb"].sort.each {|f| require f}
  



  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  #require 'factory_girl_rails'
  require 'ap'
  require 'capybara/poltergeist'
  require 'capybara/rspec'
  require 'capybara/rails'
  require 'database_cleaner'


  Capybara.javascript_driver = :poltergeist
#  Capybara.javascript_driver = :selenium_chrome
  
  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
#   xpath { |href| ".//a[@href='" + href + "']"}    

  Capybara.add_selector(:linkhref) do
    xpath { |href| ".//a[@href='" + href + "']"}    
  end

  #require 'ap'

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  # temprorary, get rid of this, it's just to get rid a message
  I18n.enforce_available_locales = true

  RSpec.configure do |config|
    #config.include ActionView::Helpers::DateHelper
    #config.include FactoryGirl::Syntax::Methods
    config.include Capybara::DSL

  #  config.include SHA1_encrypted

  #  config.include Hashing
  
  # transactional fixtures must be set to false in order for databse cleaner to work. It must also 
  # be set BEFORE the rest of the configuration

    config.use_transactional_fixtures = false

    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
      DatabaseCleaner.clean
    end

    config.before(:each) do
      DatabaseCleaner.start
      DatabaseCleaner.clean
    end

    config.after(:each) do
      DatabaseCleaner.start
      DatabaseCleaner.clean
    end

    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
  end


#end

