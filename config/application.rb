require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Worldgram
  class Application < Rails::Application
    config.serve_static_assets = true
    config.assets.compile = true
    config.assets.digest = true
    config.time_zone = 'Tokyo' # タイムゾーンを Tokyo に変更
    config.i18n.default_locale = :ja # 言語を日本語に変更 
  end
end

