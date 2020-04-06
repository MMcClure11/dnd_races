require 'httparty'
require 'pry'
require_relative './races'

class APIManager

BASE_URL = "https://www.dnd5eapi.co"

    def self.get_races
        res = HTTParty.get(BASE_URL + "/api/races")
        Races.create_from_api(res["results"])
    end

    def self.get_info_about(race)
        res = HTTParty.get(BASE_URL + "#{race.url}")
        binding.pry
    end

end

APIManager.get_races
APIManager.get_info_about(Races.all.first)

binding.pry