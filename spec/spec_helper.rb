require 'rubygems'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'ap'
require 'capybara/poltergeist'
require 'capybara/rspec'
require 'capybara/rails'
require 'database_cleaner'
require 'email_spec'
require 'simplecov'



SimpleCov.start
Capybara.javascript_driver = :poltergeist

Capybara.add_selector(:linkhref) do
  xpath { |href| ".//a[@href='" + href + "']"}    
end

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
I18n.enforce_available_locales = true

RSpec.configure do |config|
  #config.include ActionView::Helpers::DateHelper
  #config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.start
    DatabaseCleaner.clean

    #set up database here!

    FactoryGirl.create(:potential)
    Role.create(role: 'rider')
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