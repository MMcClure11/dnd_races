require "spec_helper"

RSpec.describe DndRaces::Race do

  let(:api_res) do 
    [{name: "Elf", url: "www.elf.com"},
    {name: "Dragonborn", url: "www.dragon.com"},
    {name: "Dwarf", url: "www.dwarf.com"}
    ]
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
  it "can mass_assign from an api" do
    described_class.create_from_api(api_res)
    expect(described_class.all.length).to eq(3)
  end
end