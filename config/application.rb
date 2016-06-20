require File.expand_path('../boot', __FILE__)

require 'rails/all'


Bundler.require(*Rails.groups)

module Squaredex
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use ActionDispatch::Flash
  end
end
