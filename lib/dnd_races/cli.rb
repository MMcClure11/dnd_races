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
        what_next
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

    def what_next
        #user interface: give them the choice to see the list of races, or exit by typing 'list' or 'exit'
        puts "Type 'list' to see the list of races again, or 'exit' to quit program."
        input = gets.strip.downcase
        if input == "list"
            list_races
        elsif input == "exit"
            goodbye
        else 
            puts "Invalid response."
        end
    end
  

    def goodbye
        puts "Thanks for visiting the Dungeon!"
    end

end


