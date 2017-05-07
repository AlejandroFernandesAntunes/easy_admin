require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)
ENV['RAILS_ADMIN_THEME'] = 'rollincode'

module EasyAdmin
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end
