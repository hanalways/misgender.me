class FaceGender
  FACE_API_KEY = ENV["FACE_API_KEY"]
  FACE_API_SECRET = ENV["FACE_API_SECRET"]
  FR_BASE_URL = "https://api-us.faceplusplus.com/facepp/v3/detect"

  attr_reader :assigned_gender

  def initialize(gender)
    @assigned_gender = gender
  end

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
    return new(gender_identified)
  end
end
