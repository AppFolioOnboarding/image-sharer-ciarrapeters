ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/dsl'
require 'ae_page_objects'
require 'ae_page_objects/rails'

Dir[File.dirname(__FILE__) + '/page_objects/**/*.rb'].each { |file| require file }

module ActiveSupport
  class TestCase
    include Capybara::DSL
    include Rails.application.routes.url_helpers
    Capybara.current_driver = Capybara.javascript_driver
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module ActiveRecord
  class Base
    mattr_accessor :shared_connection
    self.shared_connection = nil

    def self.connection
      shared_connection || retrieve_connection
    end
  end
end

# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

Capybara.default_driver = Capybara.javascript_driver
