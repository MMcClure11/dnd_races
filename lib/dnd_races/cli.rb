require 'pry'
require_relative './race'
require_relative './api_manager'

class DndRaces::CLI

    def call
        greeting
        get_races
        loop_program
        goodbye
    end

    def greeting
        puts "\n\nWelcome to the dungeon!\n\n"
    end

    def get_races
        DndRaces::APIManager.get_races
    end

    def loop_program
        loop do
            menu
            input = get_race_choice
            break if input == "exit"
            next if input == "invalid"
            display_race_details(input)
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
        puts "\n\nPlease choose a race by number or type 'exit' to quit program:"
    end

    def get_race_choice
        input = gets.strip.downcase
        return input if input == 'exit'
        if !valid?(input) 
            puts "\n\nI did not understand that, please enter a valid input:\n\n"
            return "invalid"
        end
        return input.to_i - 1
    end

    def valid?(input)
        input.to_i.between?(1, DndRaces::Race.all.length)
    end
   
    def display_race_details(input)
        race = DndRaces::Race.all[input]
        DndRaces::APIManager.get_info_about(race)
        race.display_race_info
        puts "Press any key to continue:"
        gets
    end

    def goodbye
        puts "\n\nThanks for visiting the Dungeon!\n\n"
    end

end


