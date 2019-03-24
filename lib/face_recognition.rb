require "awesome_print"
require "httparty"
require "dotenv"
Dotenv.load

FR_BASE_URL = "https://api-us.faceplusplus.com/facepp/v3/detect"
FACE_API_KEY = ENV["FACE_API_KEY"]
FACE_API_SECRET = ENV["FACE_API_SECRET"]

module Genderme
  class FacialRecognition
    def self.request(picture_url)
      sleep(2)
      response = HTTParty.post(
        FR_BASE_URL,
        headers: { "Content-Type" => "application/x-www-form-urlencoded" },
        body: {
          api_key: FACE_API_KEY,
          api_secret: FACE_API_SECRET,
          #   image_file: File.open("/Users/myriamwalden-duarte/Documents/laiza.jpg"), # local file... update to a file on github
          image_url: picture_url,
          #image_url: "https://arbordayblog.org/wp-content/uploads/2018/06/oak-tree-sunset-iStock-477164218-1080x608.jpg", # picture of a tree
          return_attributes: "gender,ethnicity,age",
        },
      )
      return response
    end

    def self.list(picture_url)
      response = self.request(picture_url)
      people = response["faces"]
      gender_identified = []
      if people
        people.each do |person|
          gender_identified << person["attributes"]["gender"]["value"]
        end
      end
      return gender_identified
    end
  end
end

# all of this will go away...
# result = Genderme::Facial_recognition.list("https://api-us.faceplusplus.com/facepp/v3/detect")

# puts result # working
# # if result.size > 1
# #   verb = "are"
# #   noun = "people"
# #   genders = ""
# #   result.each do |person|
# #     genders += "#{person} "
# #   end
# #   puts "There #{verb} #{result.size} #{noun} in the picture. Their genders #{verb}: #{genders}"
# # else
# #   verb = "is"
# #   noun = "person"
# #   puts "There #{verb} #{result.size} #{noun} in the picture. Their gender #{verb}: #{result}"
# # end
