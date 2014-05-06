Bloodbikeswales::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
=begin
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.assets.js_compressor = :uglifier
  config.assets.digest = true
  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.serve_static_assets = true
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'
  config.assets.compile = true





  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true


  config.action_mailer.default_url_options = { host: 'localhost:3000'}
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => "smtp.mailgun.org",
    :port => 587,
    :domain => "sandbox4610.mailgun.org",
    :user_name => "postmaster@sandbox4610.mailgun.org",
    :password => "4vbufr0vt9g2"
  }

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.serve_static_assets = true

  config.log_level = :debug
=end

  config.cache_classes = false


  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.default_url_options = { host: '128.204.195.178' }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => "smtp.mailgun.org",
    :port => 587,
    :domain => "sandbox4610.mailgun.org",
    :user_name => "postmaster@sandbox4610.mailgun.org",
    :password => "4vbufr0vt9g2"
  }



  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  config.serve_static_assets = :false
  
  config.log_level = :debug
  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

end
