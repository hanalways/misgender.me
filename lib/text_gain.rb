require "awesome_print"
require "httparty"
require "dotenv"
Dotenv.load

BASE_URL = "https://api.textgain.com/gender"
TEXT_GAIN_KEY = ENV["TEXT_GAIN_KEY"]

module Genderme
  class TextGain
    def self.request
      url = BASE_URL
      q = "So Much @UsMovie, So Little Time: @TrevorNoah & @Lupita_Nyongo talk fan art, casting and Evil Lupita."
      lang = "en"
      key = TEXT_GAIN_KEY
      sleep(2)
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
end

puts Genderme::TextGain.request
