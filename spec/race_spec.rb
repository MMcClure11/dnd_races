require "spec_helper"

RSpec.describe DndRaces::Race do

  let(:api_res) do 
    [{name: "Elf", url: "www.elf.com"},
    { name:"Dragonborn", url: "www.dragon.com"},
    {name: "Dwarf", url: "www.dwarf.com"}
    ]
  end

  let(:race) do 
    DndRaces::Race.new({name: "Elf", url: "www.elf.com"})
  end

  before(:each) do
    described_class.class_variable_set("@@all", [])
  end

  describe "#self.all" do
    it "@@all is declared as []" do
      expect(described_class.all).to eq([])
    end
  end
  
  describe "#initialize" do
    it "is initialized with a name and url" do
      r = described_class.new(name: "Elf", url: "www.elf.com")
      expect(r.is_a?(described_class)).to eq(true)
    end
  end

  describe "#self.create_from_api" do
    it "can mass assign from an api" do
      allow(described_class).to receive(:create)
      expect(described_class).to receive(:create)
      described_class.create_from_api(api_res)
    end
  end

  describe "#self.format_hash" do
    it "can reformat keys of incoming hash to be symbols" do
      formated_hash = described_class.format_hash({"name" => "Elf", "url" => "www.elf.com"})
      expect(formated_hash.has_key?(:name)).to eq(true)
      expect(formated_hash.has_key?(:url)).to eq(true)
    end
  end

  describe "#self.create" do
    it "initializes, saves, and returns the hash with keys name: and url:" do
      created_hash = described_class.create({index: "elf", name: "Elf", url: "www.elf.com"})
      expect(described_class.all).to include(created_hash)
    end
  end

  describe "#name" do
    it "retrieves the name of a race" do
      expect(race.name).to eq("Elf")
    end
  end

  describe "#name=" do
    it "can set the name of a race" do
      race.name = "Hobgoblin"
      race_name = race.instance_variable_get(:@name)
      expect(race_name).to eq("Hobgoblin")
    end
  end

  describe "#url" do
    it "retrieves the url of a race" do
      expect(race.url).to eq("www.elf.com")
    end
  end

  describe "#url=" do
    it "can set the url of a race" do
      race.url = "www.hobgoblin.com"
      race_url = race.instance_variable_get(:@url)
      expect(race_url).to eq("www.hobgoblin.com")
    end
  end

  describe "#save" do
    it "adds the Race instance to the @@all class variable" do
      race.save
      expect(DndRaces::Race.all).to include(race)
    end
  end

  describe "#full?" do
    it "checks that race_info is already populated" do
      race.speed = "30"
      expect(race.full?).to eq(true)
    end
  end
  
  describe "#display_race_info" do 

    before do 
      allow($stdout).to receive(:puts)
    end

    it "calls #display_name" do
      allow(race).to receive(:display_name)
      expect(race).to receive(:display_name)
      race.display_race_info
    end

    it "calls #display_attribute_speed" do 
      allow(race).to receive(:display_attribute_speed)
      expect(race).to receive(:display_attribute_speed)
      race.display_race_info
    end

    it "calls #display_attribute_alignment" do
      allow(race).to receive(:display_attribute_alignment)
      expect(race).to receive(:display_attribute_alignment)
      race.display_race_info
    end

    it "calls #display_attribute_lifespan" do
      allow(race).to receive(:display_attribute_lifespan)
      expect(race).to receive(:display_attribute_lifespan)
      race.display_race_info
    end

    it "calls #display_attribute_size" do
      allow(race).to receive(:display_attribute_size)
      expect(race).to receive(:display_attribute_size)
      race.display_race_info
    end

    it "calls #display_attribute_language" do
      allow(race).to receive(:display_attribute_language)
      expect(race).to receive(:display_attribute_language)
      race.display_race_info
    end
  end

  describe "#display_name" do
    let(:race) do 
      DndRaces::Race.new({name: "Dwarf", url: "www.dwarf.com"})
    end
    it "outputs the name of the race" do
      expect($stdout).to receive(:puts).with("\nDwarf\n\n")
      race.display_name
    end
  end

  # describe "#display_attribute_speed" do
  #   let(:race) do 
  #     DndRaces::APIManager.get_info_about({speed: "45"})
  #   end
  #   it "outputs the speed of the race" do
  #     expect($stdout).to receive(:puts).with("Speed: 45 \n\n")
  #     race.display_attribute_speed
  #   end
  # end

end