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
    r = described_class.new(name: "Elf", url: "www.hello.com")
    expect(r.is_a?(described_class)).to eq(true)
  end
  it "can mass assign from an api" do
    described_class.create_from_api(api_res)
    expect(described_class.all.length).to eq(3)
  end
  it "can reformat keys of incoming hash to be symbols" do
    formated_hash = DndRaces::Race.format_hash({"name" => "Elf", "url" => "www.elf.com"})
    expect(formated_hash.has_key?(:name)).to eq(true)
    expect(formated_hash.has_key?(:url)).to eq(true)
  end
  it "initializes, saves, and returns the hash with keys name: and url:" do
    created_hash = DndRaces::Race.create({index: "elf", name: "Elf", url: "www.elf.com"})
    expect(DndRaces::Race.all).to include(created_hash)
  end
  it "retrieves the name of a race" do
    described_class.name
    expect(race.name).to eq("Elf")
  end
end



  