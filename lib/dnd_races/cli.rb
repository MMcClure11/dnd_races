require 'pry'
require_relative './race'
require_relative './api_manager'

class DndRaces::CLI

    def call
        greeting
        list_races
        # race = DndRaces::Race.all[input_to_index]
        # DndRaces::APIManager.get_info_about(race)
        # race.display_race_info
        
        goodbye
    end

    def greeting
        puts "Welcome to the dungeon! Please select a number to learn more about that race.\n\n"
    end

    def list_races
        DndRaces::APIManager.get_races
        # DndRaces::Race.all.each_with_index do |r, i|
        #     puts "#{i + 1}. #{r.name}"
        # end
    end

    def input_to_index
        input = gets.strip.to_i
        input - 1
    end

   

    def goodbye
        puts "Thanks for visiting the Dungeon!"
    end

end


