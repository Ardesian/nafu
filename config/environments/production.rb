Rails.application.configure do

  config.cache_classes = true
  config.eager_load = true
  config.force_ssl = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.action_mailer.default_url_options = { host: "nafu.ardesian.com", port: 6238 }
  config.action_cable.url = "wss://nafu.ardesian.com/cable"
  config.action_cable.allowed_request_origins = [/https:\/\/*/]

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = true
  config.assets.digest = true
  config.serve_static_assets = false

  config.active_storage.service = :local
  config.log_level = :debug
  config.log_tags = [ :request_id ]

  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
