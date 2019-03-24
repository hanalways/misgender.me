require "dotenv"
require "twitter"
require "pry"
require "awesome_print"

Dotenv.load

module Genderme
  class TwitterUser
    attr_reader :user_name, :name, :tweets, :profile_image_url, :bio

    def initialize(user_name:, name:, tweets:, profile_image_url:, bio:)
      @user_name = user_name
      @name = name
      @tweets = tweets
      @profile_image_url = profile_image_url
      @bio = bio
    end

    def self.info_request
      client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV["TWITTER_KEY"]
        config.consumer_secret = ENV["TWITTER_SECRET_KEY"]
        config.access_token = ENV["TWITTER_TOKEN"]
        config.access_token_secret = ENV["TWITTER_SECRET_TOKEN"]
      end

      return client
    end

    def self.fetch_user(user)
      client = Genderme::TwitterUser.info_request

      begin
        user = client.user(user)
      rescue Twitter::Error::NotFound
        return nil
      end

      ap user

      user_timeline = client.user_timeline(user)
      tweets = user_timeline.map { |tweet| tweet.text }

      Genderme::TwitterUser.new(user_name: user.screen_name,
                                name: user.name,
                                tweets: tweets,
                                profile_image_url: user.profile_image_url,
                                bio: user.description)
    end
  end
end
