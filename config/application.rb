require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FakeFarmApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    %w(decorators services).each do | dir|
      config.autoload_paths << "#{Rails.root}/app/dir"
    end

    config.generators do |g|
      g.stylesheets  false
      g.javascripts  false
      g.helper       false
    end
  end
end
