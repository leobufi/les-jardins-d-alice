require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LesJardinsDAlice
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # Configuration for the application, engines, and railties goes here.
    config.autoload_once_paths << "#{Rails.root}/app/services"
    config.eager_load_paths << "#{Rails.root}/test/mailers/previews"
    config.active_record.use_yaml_unsafe_load = true
    config.action_mailer.asset_host = 'https://www.jardinsdalice.com/'

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
