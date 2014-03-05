require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'vcr'
require 'webmock'
require 'uceem'

EMAIL    = 'uceem_gem_test@beta.uceem.com.local'
PASSWORD = 'password'

RSpec.configure do |config|
  config.color_enabled = true
end

# Override the request method for mocking.
module Uceem
  @base_url = 'https://beta.uceem.com'
end

def login
  VCR.use_cassette('login') do
    Uceem::Authentication.begin_session(EMAIL, PASSWORD)
  end
end

def reset_login
  Uceem::Authentication.end_session
end

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end
