require_relative "twitter_user"
require_relative "text_gain"
require_relative "face_recognition"
require_relative "name_gender"
require "awesome_print"
require "dotenv"
require "pry"

Dotenv.load

def gender_user(username)
  user = Genderme::TwitterUser.fetch_user(username)
  face_gender = Genderme::FacialRecognition.list(user.profile_image_url.to_s)
  name_gender = Genderme::NameGender.request(user.name, "US")

  tweets = user.tweets
  post_genders = []
  tweets.each do |tweet|
    post_genders << Genderme::TextGain.request(tweet)
  end

  percent_female = post_genders.count { |gender| gender == "f" } / post_genders.length.to_f
  percent_male = post_genders.count { |gender| gender == "m" } / post_genders.length.to_f
  gender_breakdown = { male: "#{percent_male * 100}%",
                      female: "#{percent_female * 100}%" }

  result = { face_gender: face_gender,
             name_gender: name_gender,
             posts_gender: gender_breakdown }
end

puts "What gender will a machine assign you? Enter your twitter username:"
username = gets.chomp
result = gender_user(username)
puts "According to the Facial Recognition model, a machine would guess that your gender is #{result[:face_gender]}"
puts "According to the Name Recognition model, a machine would guess that your gender is #{result[:name_gender]}"
puts "According to the Text Analysis model, a machine would say that your tweets are #{result[:posts_gender][:male]}% male" +
       "and #{result[:posts_gender][:female]}% female"
