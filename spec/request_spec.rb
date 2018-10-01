require_relative '../server'
require 'rack/test'

describe 'calculator app' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

end
