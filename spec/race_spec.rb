require "spec_helper"

RSpec.describe DndRaces::Race do

  let(:api_res) do 
    [{name: "Elf", url: "www.elf.com"},
    { name:"Dragonborn", url: "www.dragon.com"},
    {name: "Dwarf", url: "www.dwarf.com"}
    ]
  end

  let(:race) do DndRaces::Race.new({name: "Elf", url: "www.elf.com"})
end

  before(:each) do
    described_class.class_variable_set("@@all", [])
  end

  it "@@all is declared as []" do
    expect(described_class.all).to eq([])
  end
  it "is initialized with a name and url" do
    r = described_class.new(name: "Elf", url: "www.elf.com")
    expect(r.is_a?(described_class)).to eq(true)
  end
  it "can mass assign from an api" do
    described_class.create_from_api(api_res)
    expect(described_class.all.length).to eq(3)
  end
  it "can reformat keys of incoming hash to be symbols" do
    formated_hash = described_class.format_hash({"name" => "Elf", "url" => "www.elf.com"})
    expect(formated_hash.has_key?(:name)).to eq(true)
    expect(formated_hash.has_key?(:url)).to eq(true)
  end
  it "initializes, saves, and returns the hash with keys name: and url:" do
    created_hash = described_class.create({index: "elf", name: "Elf", url: "www.elf.com"})
    expect(described_class.all).to include(created_hash)
  end
  it "retrieves the name of a race" do
    described_class.name
    expect(race.name).to eq("Elf")
  end
  it "can set the name of a race" do
    race.name = "Hobgoblin"
    race_name = race.instance_variable_get(:@name)
    expect(race_name).to eq("Hobgoblin")
  end
  it "retrieves the url of a race" do
    race.url
    expect(race.url).to eq("www.elf.com")
  end
  it "can set the url of a race" do
    race.url = "www.hobgoblin.com"
    race_url = race.instance_variable_get(:@url)
    expect(race_url).to eq("www.hobgoblin.com")
  end
  it "adds the Race instance to the @@all class variable" do
    race.save
    expect(DndRaces::Race.all).to include(race)
  end
  it "checks that race_info is already populated" do
    race.speed = "30"
    expect(race.full?).to eq(true)
  end
  
end