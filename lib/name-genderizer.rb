require "httparty"
require "dotenv"

Dotenv.load

module Genderizer
  class Name
    attr_reader :first_name, :last_name, :country

    def initialize(first_name, last_name, country = nil)
      @first_name = first_name
      @last_name = last_name
      @country = country
    end

    def first_last
      puts ENV["NAMSOR_TOKEN"]

      url_1 = "https://v2.namsor.com/NamSorAPIv2/api2/json/gender/#{@first_name}/#{@last_name}"

      response = HTTParty.get(url_1, {
        headers: {"accept" => "application/json", "X-API-KEY" => ENV["NAMSOR_TOKEN"]},
      })

      if (response.code == 200)
        gender = response["likelyGender"]
        puts response["likelyGender"]
        return gender
      else
        puts "Error #{response.code} : #{response["message"]}"
      end
    end

    def first_last_country
      url_2 = "https://v2.namsor.com/NamSorAPIv2/api2/json/genderGeo/#{@first_name}/#{@last_name}/#{@country}"

      query_parameters = {
        "X-API-KEY": ENV["NAMSOR_TOKEN"],
        firstName: @first_name,
        lastName: @last_name,
        countryIso2: @country,
      }

      response = HTTParty.get(url_2, {
        headers: {"accept" => "application/json", "X-API-KEY" => ENV["NAMSOR_TOKEN"]},
      })
      if (response.code == 200)
        gender = response["likelyGender"]
        puts response["likelyGender"]
        return gender
      else
        puts "Error #{response.code} : #{response["message"]}"
      end
    end
  end
end

me = Genderizer::Name.new("laneia", "murray", "CA")
me.first_last
me.first_last_country
