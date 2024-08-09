require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.hosts << "apiauto.online"
    #####################################################
    config.time_zone = "Europe/Moscow"
    # config.eager_load_paths << Rails.root.join("extras")
    #I18n config
    # Permitted locales available for the application
    config.I18n.available_locales = [:en, :ru]
    # Set default locale to something other than :en
    # но пока локали у нас нет русской
    config.I18n.default_locale = :ru
  end
end
