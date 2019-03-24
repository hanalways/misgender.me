require_relative "face_recognition"
require "awesome_print"
require "httparty"
require "dotenv"
Dotenv.load

module Genderme
  class Main
    # def initialize

    # end
    def twitter_info
      #import fields from the twitter class
    end

    # send the info from twitter to each of the classes and give gender back

    # get gender from:
    # face_recognition

    def face_recognition(picture_url)
      gender_face = Genderme::Facial_recognition.list(picture_url)
      return gender_face
    end

    def name_gender #(name, country)
      gender_name_country_one = Genderme::NameGender.request #(name, country)
      return gender_name_country_one
    end

    def name_genderizer(first_name, last_name, country)
      user_info = Genderme::Name.new(first_name, last_name, country)
      gender_name_two = user_info.first_last
      return gender_name_two
    end

    def name_genderizer_country(first_name, last_name, country)
      user_info = Genderme::Name.new(first_name, last_name, country)
      gender_name_country_two = user_info.first_last_country
      return gender_name_country_two
    end

    def text_gain(tweets)
      tweets_total = []
      tweets.each do |tweet|
        tweets_total << Genderme::TextGain.request(tweet)
      end
      tweets_gendered = calculate_percentage(tweets_total)
      #   calculate_percentage(tweets_total)
      #   male = 0
      #   female = 0
      #   tweets_total.each do |gender|
      #     if gender == "m"
      #       male += 1
      #     elsif gender == "f"
      #       female += 1
      #     else
      #       puts "weird" ########## Check it out
      #     end
      #   end

      #   percentage_male = 0.0
      #   percentage_female = 0.0

      #   percentage_male = tweets.length * 100 / male
      #   percentage_female = tweets.length * 100 / female
      #   gendered_tweets = {
      #     male: percentage_male,
      #     female: percentage_female,
      #   }
      #   return gendered_tweets
    end

    def calculate_percentage(tweets_total)
      male = 0
      female = 0
      tweets_total.each do |gender|
        if gender == "m"
          male += 1
        elsif gender == "f"
          female += 1
        else
          puts "weird" ########## Check it out
        end
      end

      percentage_male = 0.0
      percentage_female = 0.0
      percentage_male = tweets.length * 100 / male
      percentage_female = tweets.length * 100 / female
      gendered_tweets = {
        male: percentage_male,
        female: percentage_female,
      }
      return gendered_tweets
    end

    # name_gender OK
    # name_genderizer OK
    # text_gain

  end
end
