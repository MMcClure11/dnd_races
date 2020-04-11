require "spec_helper"

RSpec.describe DndRaces::CLI do

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

end
