require "httparty"
require "pry"

require "dotenv"
Dotenv.load

class Tweet
  BASE_URL = "https://api.textgain.com/gender"
  TOKEN = ENV["TEXTGAIN_TOKEN"]

  attr_reader :response, :gender, :confidence

  def initialize
    @response = response
    @gender = gender
    @confidence = confidence
  end

  def self.response(tweet)
    body_params = {
      key: TOKEN,
      lang: "en",
      q: tweet
    }

    response = HTTParty.get(BASE_URL, query: body_params)

    if response != 200
      raise StandardError, "Oops, request denied! :("
    else
      return response
    end
  end

  # def gender_result
  #   return gender
  # end

  # def confidence
  #   return confidence
  # end
end
