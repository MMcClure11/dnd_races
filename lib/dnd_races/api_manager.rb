require 'httparty'
require 'pry'
require_relative './race'

class APIManager

BASE_URL = "https://www.dnd5eapi.co"

    def self.get_races
        res = HTTParty.get(BASE_URL + "/api/races")
       Race.create_from_api(res["results"])
    
    end

    def self.get_info_about(race)
        res = HTTParty.get(BASE_URL + "#{race.url}")
        race.speed = res["speed"]
        race.age = res["age"]
    end

end

