Option to refactor class DndRaces::Race

class DndRaces::Race

    @@all = []

    def self.all
        @@all
    end

    def self.create_from_api(array_of_hashes)
        array_of_hashes.each do |racehash|
            new(racehash["name"], racehash["url"])
        end
    end

    attr_accessor :name, :url, :speed, :alignment, :age, :size_description, :language_desc

    def initialize(index = nil, name, url)
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

    def full?
        !!@speed
    end

    def display_race_info
        array = [
            display_name,
            display_attribute_speed,
            display_attribute_alignment,
            display_attribute_lifespan,
            display_attribute_size,
            display_attribute_language,
        ]
        array.join
    end

    def display_name
        "\n#{name}\n\n"
    end

    def display_attribute_speed
        "Speed: #{speed}\n\n"
    end

    def display_attribute_alignment
        "Alignment: #{alignment}\n\n"
    end

    def display_attribute_lifespan
        "Lifespan: #{age}\n\n"
    end

    def display_attribute_size
        "Size: #{size_description}\n\n"
    end
    
    def display_attribute_language
        "Language: #{language_desc}\n\n"
    end

end