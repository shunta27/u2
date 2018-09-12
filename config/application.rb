require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    config.action_view.field_error_proc = proc { |html_tag, instance| html_tag }
    # config.action_view.field_error_proc = proc { |html_tag, instance| "<div class='has-error'>#{html_tag}</div>".html_safe }
  end
end
