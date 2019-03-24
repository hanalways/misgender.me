require "awesome_print"
require "httparty"
require "dotenv"
Dotenv.load

BASE_URL = "https://api-us.faceplusplus.com/facepp/v3/detect"
FACE_API_KEY = ENV["FACE_API_KEY"]
FACE_API_SECRET = ENV["FACE_API_SECRET"]

module Genderme
  class Facial_recognition
    def self.request
      sleep(2)
      response = HTTParty.post(
        "#{BASE_URL}",
        headers: {"Content-Type" => "application/x-www-form-urlencoded"},
        body: {
          api_key: FACE_API_KEY,
          api_secret: FACE_API_SECRET,
          #   image_file: File.open("/Users/myriamwalden-duarte/Documents/laiza.jpg"), # local file... update to a file on github
          image_url: "https://scontent-iad3-1.cdninstagram.com/vp/bd35db060cbc44789f56debe77a8c14a/5D104047/t51.2885-15/e35/17126226_1130396690423201_6067009070764654592_n.jpg?_nc_ht=scontent-iad3-1.cdninstagram.com",
          #image_url: "https://arbordayblog.org/wp-content/uploads/2018/06/oak-tree-sunset-iStock-477164218-1080x608.jpg", # picture of a tree
          return_attributes: "gender,ethnicity,age",
        },
      )
      return response
    end

    def self.list
      response = self.request
      people = response["faces"]
      gender_identified = []
      people.each do |person|
        gender_identified << person["attributes"]["gender"]["value"]
      end
      return gender_identified
    end
  end
end

result = Genderme::Facial_recognition.list

# if result.size == 0
#   puts "Unidentified picture"
# els
if result.size > 1
  verb = "are"
  noun = "people"
  genders = ""
  result.each do |person|
    genders += "#{person} "
  end
  puts "There #{verb} #{result.size} #{noun} in the picture. Their genders #{verb}: #{genders}"
else
  verb = "is"
  noun = "person"
  puts "There #{verb} #{result.size} #{noun} in the picture. Their gender #{verb}: #{result}"
end
