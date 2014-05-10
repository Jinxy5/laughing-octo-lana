Bloodbikeswales::Application.configure do
  # mailgun
  config.action_mailer.default_url_options = { host: 'http://www.bloodbikeswales.org.uk/links' }
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
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.assets.version = '1.0'
  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

end
