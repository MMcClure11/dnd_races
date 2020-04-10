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
        @name = name
        @url = url
        @speed, @alignment, @age, @size_description, @language_desc = nil, nil, nil, nil, nil
        save
    end

    def save
        @@all << self
    end

    def full?
        !!@speed
    end

    def display_race_info
        display_name
        display_attribute_speed
        display_attribute_alignment
        display_attribute_lifespan
        display_attribute_size
        display_attribute_language
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