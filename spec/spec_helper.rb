# # spec/spec_helper.rb
# require "rack/test"
# require "rspec"
# require "bundler"
# Bundler.require
#
ENV["RACK_ENV"] = "test"
#
# require File.expand_path "../../server.rb", __FILE__
#
# module RSpecMixin
#   include Rack::Test::Methods
#   def app
#     Sinatra::Application
#   end
# end
#
#
# # For RSpec 2.x and 3.x
# RSpec.configure { |c| c.include RSpecMixin }
#
# Shoulda::Matchers.configure do |c|
#   c.integrate do |w|
#     w.test_framework :rspec
#     w.library :active_record
#   end
# end

require File.expand_path("../../server.rb", __FILE__)

module Mixin
  include Rack::Test::Methods
  def app()
    Sinatra::Application
  end
end

RSpec.configure do |c|
  c.include Mixin

  c.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  c.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

Shoulda::Matchers.configure do |c|
  c.integrate do |w|
    w.test_framework :rspec
    w.library :active_record
  end
end
