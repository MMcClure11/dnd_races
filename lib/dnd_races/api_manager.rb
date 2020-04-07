require 'httparty'
require 'pry'
require_relative './race'

class APIManager

BASE_URL = "https://www.dnd5eapi.co"

    def self.get_races
        res = HTTParty.get(BASE_URL + "/api/races")
        Race.create_from_api(res["results"])
        binding.pry
    end

    def self.get_info_about(race)
        res = HTTParty.get(BASE_URL + "#{race.url}")
        binding.pry
    end

end

APIManager.get_races
APIManager.get_info_about(Race.all.first)

binding.pry