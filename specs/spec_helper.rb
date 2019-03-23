require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require "minitest/skip_dsl"
require "vcr"
require 'dotenv'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

VCR.configure do |config|
  config.cassette_library_dir = "specs/cassettes"
  config.hook_into :webmock
  config.default_cassette_options = {
    :record => :new_episodes,    # record new data when we don't have it yet
    :match_requests_on => [:method, :uri, :body], # The http method, URI and body of a request all need to match
  }
  config.filter_sensitive_data("TWITTER") do
    ENV["TWITTER_KEY"]
    ENV["TWITTER_SECRET_KEY"]
    ENV["TWITTER_TOKEN"]
    ENV["TWTITTER_SECRET_TOKEN"]
  end
end

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
  config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
  config.access_token        = ENV["YOUR_ACCESS_TOKEN"]
  config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
end