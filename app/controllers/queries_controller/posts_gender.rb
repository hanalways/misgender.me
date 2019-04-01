class PostsGender
  attr_reader :assigned_gender
  
  TG_BASE_URL = "https://api.textgain.com/gender"
  TEXT_GAIN_KEY = ENV["TEXT_GAIN_KEY"]

  def initialize(gender)
    @assigned_gender = gender
  end

  def self.request(tweet)
    url = TG_BASE_URL
    q = tweet
    lang = "en"
    key = TEXT_GAIN_KEY
    sleep(1)
    query = {
      q: q,
      lang: lang,
      key: TEXT_GAIN_KEY,
    }
    response = HTTParty.get(url, query: query)
    gender = response["gender"]
    return gender
  end
end
