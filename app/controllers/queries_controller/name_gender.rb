class NameGender
  BASE_URL = "https://gender-api.com/get"
  NAME_GENDER_KEY = ENV["NAME_GENDER_KEY"]

  attr_reader :assigned_gender

  def initialize(gender)
    @assigned_gender = gender
  end

  def self.request(name, country)
    name = name
    country = country
    url = BASE_URL
    sleep(1)
    query = {
      name: name,
      country: country,
      key: NAME_GENDER_KEY,
    }
    response = HTTParty.get(url, query: query)

    gender = response["gender"]

    return new(gender)
  end
end
