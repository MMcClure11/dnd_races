require 'pry'
require_relative './race'
require_relative './api_manager'

class CLI

    def call
        puts "Welcome to the dungeon! Please select a race number to learn more about that race.\n\n"
        list_races
        race = Race.all[input_to_index]
        APIManager.get_info_about(race)
        race.display_race_info
        goodbye
    end

    def list_races
        APIManager.get_races
        Race.all.each_with_index do |r, i|
            puts "#{i + 1}. #{r.name}"
        end
    end

    def input_to_index
        input = gets.strip.to_i
        input - 1
    end

  

    def goodbye

    end

end


