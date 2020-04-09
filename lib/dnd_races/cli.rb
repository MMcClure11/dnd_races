require 'pry'
require_relative './race'
require_relative './api_manager'

class DndRaces::CLI

    attr_accessor :race

    def call
        greeting
        get_races
        menu
    end

    def greeting
        puts "\n\nWelcome to the dungeon!\n\n"
    end

    def get_races
        DndRaces::APIManager.get_races
    end

    def menu
        display_race_list
        display_instructions
        get_race_choice
    end

    def display_race_list
        DndRaces::Race.all.each_with_index do |r, i|
            puts "#{i + 1}. #{r.name}"
        end
    end

    def display_instructions
        puts "\n\nPlease choose a race by number or enter 'exit' to quit program:\n\n"
    end

    def get_race_choice
        input = gets.strip.downcase
        if input == 'exit'
            goodbye
        elsif !race_choice_valid?(input) 
            puts "\n\nI did not understand that, please enter a valid input:\n\n"
            menu
        else 
            self.race = DndRaces::Race.all[input.to_i - 1]
            DndRaces::APIManager.get_info_about(race)
            attribute_options
            handle_print_attributes
        end
    end

    def race_choice_valid?(input)
        input.strip.to_i.to_s == input.strip && input.to_i.between?(1, DndRaces::Race.all.length)
    end

    def attribute_options
        self.race.display_name
        puts "1. Speed"
        puts "2. Alignment"
        puts "3. Lifespan"
        puts "4. Size"
        puts "5. Language"
        puts "6. View all attributes"
        puts "7. Race Menu"
        puts "\n\nEnter a number to see more about an attribute or return to the Race Menu:\n\n"
    end

    def print_attributes(input)
        race.display_attribute_speed if input == "1"
        race.display_attribute_alignment if input == "2"
        race.display_attribute_lifespan if input == "3"
        race.display_attribute_size if input == "4"
        race.display_attribute_language if input == "5"
        race.display_race_info if input == "6" 
        attribute_options
    end

    def handle_print_attributes
        input = gets.strip.downcase
        if input == "7" 
            menu
        elsif (1..6).include?(input.to_i)
            print_attributes(input)
            handle_print_attributes
        else
            invalid_attribute_input 
        end
    end

    def invalid_attribute_input
        puts "\n\nThat is not a valid option. Please try again!\n\n"
        attribute_options
        handle_print_attributes
    end

    def goodbye
        puts "\n\nThanks for visiting the Dungeon!\n\n"
    end

end