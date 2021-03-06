require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nafu
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application
    config.time_zone = "Mountain Time (US & Canada)"

    config.assets.quiet = true
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.action_cable.mount_path = '/cable'

    config.after_initialize do
      Rails.cache.write("login_queue", {})
      ActionCable.server.broadcast("login_queue", { ping: true })
    end
  end
end
