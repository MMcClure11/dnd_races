 require './lib/dnd_races.rb'

class DndRaces::Race

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

    attr_accessor :name, :url, :speed, :alignment, :age, :size_description, :language_desc
    
    def initialize(name:, url:)
        # @index = index
        @name = name
        @url = url
        @speed = nil
        @alignment = nil
        @age = nil
        @size_description = nil
        @language_desc = nil

        save
    end

    def save
        @@all << self
    end

    def display_race_info
        puts "\n#{name}\n\n"
        puts "Speed: #{speed}\n\n"
        puts "Alignment: #{alignment}\n\n"
        puts "Lifespan: #{age}\n\n"
        puts "Size: #{size_description}\n\n"
        puts "Language: #{language_desc}\n\n"
    end

    def display_name
        puts "\n#{name}\n\n"
    end

    def display_attribute_speed
        puts "Speed: #{speed}\n\n"
    end

    def display_attribute_alignment
        puts "Alignment: #{alignment}\n\n"
    end

    def display_attribute_lifespan
        puts "Lifespan: #{age}\n\n"
    end

    def display_attribute_size
        puts "Size: #{size_description}\n\n"
    end
    
    def display_attribute_language
        puts "Language: #{language_desc}\n\n"
    end

end