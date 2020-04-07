# require './lib/dnd_races.rb'

class Race

    @@all = []

    def self.all
        @@all
    end

    def self.create_from_api(array_of_hashes)
        array_of_hashes.each do |racehash|
            self.create(self.format_hash(racehash))
        end
    end

    def self.format_hash(hsh)
        hsh.each_with_object({}) do |(k,v), mem|
            mem[k.to_sym] = v
        end
    end

    def self.create(index:, name:, url:)
        new(name: name, url: url)
    end

    attr_accessor :name, :url, :speed, :age
    
    def initialize(name:, url:)
        # @index = index
        @name = name
        @url = url
        @speed = nil
        @age = nil

        save
    end

    def save
        @@all << self
    end

    def display_race_info
        puts "\n#{name}\n\n"
        puts "Speed: #{speed}\n\n"
        puts "Lifespan: #{age}\n\n"
    end

end