require "spec_helper"

RSpec.describe DndRaces::Race do

  let(:api_res) do 
    [{name: "Elf", url: "www.elf.com"},
    { name:"Dragonborn", url: "www.dragon.com"},
    {name: "Dwarf", url: "www.dwarf.com"}
    ]
  end

  let(:race) do 
    described_class.new(name: "Elf", url: "www.elf.com")
  end

  before(:each) do
    described_class.class_variable_set("@@all", [])
  end

  describe "#self.all" do
    it "@@all is declared as []" do
      expect(described_class.all).to eq([])
    end
  end

  describe "#self.create_from_api" do
    it "can mass assign from an api" do
      described_class.create_from_api(api_res)
      expect(described_class.all.length).to eq(3)
    end
  end

  describe "#full?" do
    it "checks that race_info is already populated" do
      race.speed = "30"
      expect(race).to  be_full
    end
  end
  
  describe "#display_race_info" do 

    it "#display_race_info returns all of the attributes for a particular race" do
      dwarf = described_class.new(name: "Dwarf", speed: "27", alignment: "sometimes nice", age: "old fart", size_description: "tiny person", language_desc: "dwarvish")
      expect(dwarf.display_race_info).to eq("\nDwarf\n\nSpeed: 27\n\nAlignment: sometimes nice\n\nLifespan: old fart\n\nSize: tiny person\n\nLanguage: dwarvish\n\n")
    end

  end

  describe "#display_name" do
    let(:race) do 
      DndRaces::Race.new({name: "Dwarf", url: "www.dwarf.com"})
    end
    it "outputs the name of the race" do
      expect(race.display_name).to eq("\nDwarf\n\n")
    end
  end

end