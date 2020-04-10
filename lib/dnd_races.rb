require_relative "./dnd_races/version"
require "httparty" 
require_relative "./dnd_races/cli"
require_relative "./dnd_races/api_manager" #why does mine need ./dnd_races before /api_manager and Micah's did not?
require_relative "./dnd_races/race"
require "pry"

module DndRaces
  class Error < StandardError; end
  # Your code goes here...
end

