require 'pry'
require_relative './race'
require_relative './api_manager'

class DndRaces::CLI

    attr_accessor :race

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
            print_attributes(input)
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
        puts "\n\nPlease choose a race by number or enter 'exit' to quit program:"
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
        @race = DndRaces::Race.all[input]
        DndRaces::APIManager.get_info_about(race)
        attribute_options(input)
    end

    def attribute_options(input)
        race.display_name
        puts "1. Speed"
        puts "2. Alignment"
        puts "3. Lifespan"
        puts "4. Size"
        puts "5. Language"
        puts "6. Print all attributes"
        puts "7. Race Menu"
        puts "Enter a number to see more about an attribute or return to the Race Menu:"
    end

    def print_attributes(input)
        loop do 
            input = gets.strip
            race.display_attribute_speed if input == "1"
            race.display_attribute_alignment if input == "2"
            race.display_attribute_lifespan if input == "3"
            race.display_attribute_size if input == "4"
            race.display_attribute_language if input == "5"
            race.display_race_info if input == "6"
            #attribute_options(input)
            break if input == "7" 
        end
    end

    def goodbye
        puts "\n\nThanks for visiting the Dungeon!\n\n"
    end

end


