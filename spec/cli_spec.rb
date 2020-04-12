require "spec_helper"

RSpec.describe DndRaces::CLI do

  let(:api_res) do 
    [{name: "Elf", url: "www.elf.com"},
    { name:"Dragonborn", url: "www.dragon.com"},
    {name: "Dwarf", url: "www.dwarf.com"}
    ]
  end

  let(:race) do 
    DndRaces::Race.new({name: "Elf", url: "www.elf.com"})
  end

  describe "#call" do
    cli = DndRaces::CLI.new

    before do
      allow($stdout).to receive(:puts)
      allow(cli).to receive(:gets)
      allow(cli).to receive(:get_races)
      allow(cli).to receive(:menu)
    end
    
    it "calls #greeting" do
      allow(cli).to receive(:greeting)
      expect(cli).to receive(:greeting)
      cli.call
    end

    it "calls #get_races" do
      allow(cli).to receive(:get_races)
      expect(cli).to receive(:get_races)
      cli.call
    end

    it "calls #menu" do
      allow(cli).to receive(:menu)
      expect(cli).to receive(:menu)
      cli.call
    end
  end

  describe "#greeting" do

    before do
      allow($stdout).to receive(:puts)
    end

    it "outputs a greeting" do
      cli = DndRaces::CLI.new
      expect($stdout).to receive(:puts).with("\n\nWelcome to the dungeon!\n\n")
      cli.greeting
    end
  end

  describe "#get_races" do
    cli = DndRaces::CLI.new
    race_response = {name: "Elf", url: "www.elf.com"}

    before do
      allow(DndRaces::APIManager).to receive(:get_races).and_return(race_response)
    end

    it "calls APIManager.get_races" do
      expect(DndRaces::APIManager).to receive(:get_races)
      cli.get_races
    end
  end

  describe "#menu" do
    cli = DndRaces::CLI.new

    before do
      allow($stdout).to receive(:puts)
      allow(cli).to receive(:display_race_list)
      allow(cli).to receive(:display_instructions)
      allow(cli).to receive(:get_race_choice)
    end

    it "calls #display_race_list" do
      # allow(cli).to receive(:display_race_list)
      expect(cli).to receive(:display_race_list)
      cli.display_race_list
    end

    it "calls #display_instructions" do
      expect(cli).to receive(:display_instructions)
      cli.display_instructions
    end

    it "calls #get_race_choice" do
      expect(cli).to receive(:get_race_choice)
      cli.get_race_choice
    end
  end

  describe "#display_race_list" do
  cli = DndRaces::CLI.new
  let(:race) do 
    DndRaces::Race.new({name: "Elf", url: "www.elf.com"})
  end

    xit "prints all races from the DND API in a numbered list" do 
      expect($stdout).to receive(:puts).with("1. Elf")

      cli.display_race_list
    end
  end

  describe "#display_instructions" do
    cli = DndRaces::CLI.new
    it "outputs instructions for user" do
      expect($stdout).to receive(:puts).with("\n\nPlease choose a race by number or enter 'exit' to quit program:\n\n")
      cli.display_instructions
    end

  end

end
