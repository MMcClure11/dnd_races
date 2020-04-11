require "spec_helper"

# RSpec.describe DndRaces::APIManager do

#   describe "#self.get_races" do

#     it "returns the DND races from the API" do 
      
#       response_body = {"count"=>3,
#       "results"=>
#        [{"index"=>"dragonborn", "name"=>"Dragonborn", "url"=>"/api/races/dragonborn"},
#         {"index"=>"dwarf", "name"=>"Dwarf", "url"=>"/api/races/dwarf"},
#         {"index"=>"elf", "name"=>"Elf", "url"=>"/api/races/elf"}]}
#       allow(described_class).to receive(:get_races).and_return(response_body)
#       response = DndRaces::APIManager.get_races
#       expect(response[:name]).to eq("Elf")
#     end

#   end

#   # describe "#self.get_info_about" do

#   #   it "returns the speed attribute for a race" do
#   #   end

#  # end

# end