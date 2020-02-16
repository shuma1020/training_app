require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    require_relative 'boot'
    require 'rails/all'
    Bundler.require(*Rails.groups)
    module Projects
      class Application < Rails::Application
        config.load_defaults 5.1
        config.generators do |g|
          g.test_framework :rspec,
          view_specs: false,
          helper_specs: false,
          routing_specs: false
        end
      end
    end
    config.generators.system_tests = nil
    #　以下の記述を追記する(設定必須)

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.available_locales = [:ja, :en]
    config.time_zone = 'Tokyo'
  end
end
