require 'httparty'
require 'pry'
require_relative './race'

class DndRaces::APIManager

BASE_URL = "https://www.dnd5eapi.co"

    def self.get_races
        res = HTTParty.get(BASE_URL + "/api/races")
       DndRaces::Race.create_from_api(res["results"])
    
    end

    def self.get_info_about(race)
        res = HTTParty.get(BASE_URL + "#{race.url}")
        race.speed = res["speed"]
        race.alignment = res["alignment"]
        race.age = res["age"]
        race.size_description = res["size_description"]
        race.language_desc = res["language_desc"]
    end

end

