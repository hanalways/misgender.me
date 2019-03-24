require "awesome_print"
require "httparty"
require "dotenv"
Dotenv.load

BASE_URL = "https://gender-api.com/get"
NAME_GENDER_KEY = ENV["NAME_GENDER_KEY"]

module Genderme
  class NameGender
    def self.request
      name = "Andrea"
      country = "USA"
      url = BASE_URL
      sleep(2)
      query = {
        name: name,
        country: country,
        key: NAME_GENDER_KEY,
      }
      response = HTTParty.get(url, query: query)
      gender = response["gender"]

      return gender
    end
  end
end

puts Genderme::NameGender.request
