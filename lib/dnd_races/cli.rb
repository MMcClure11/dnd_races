require 'pry'
require_relative './race'
require_relative './api_manager'

class DndRaces::CLI

    def call
        greeting
        get_races
        loop_program
        # race = DndRaces::Race.all[input_to_index]
        # DndRaces::APIManager.get_info_about(race)
        # race.display_race_info
        
        goodbye
    end

    def greeting
        puts "Welcome to the dungeon! Please select a number to learn more about that race.\n\n"
    end

    def get_races
        DndRaces::APIManager.get_races
    end

    def loop_program
        loop do
            menu
            input = get_race_choie
            break if input == "exit"
            next if input == "invalid"
            display_race_info(input)
        end
    end

    def menu
        display_race_list
        display_instructions
    end

    def display_race_list
        DndRaces::Race.all.each_with_index do |r, i|
            puts "#{i + 1}. #{r.name}"
        end
    end

    def display_instructions
        puts "Please choose a race by number or type 'exit' to quit program:"
    end

    def input_to_index
        input = gets.strip.to_i
        input - 1
    end

   

    def goodbye
        puts "Thanks for visiting the Dungeon!"
    end

end


