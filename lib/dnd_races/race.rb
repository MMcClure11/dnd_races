class DndRaces::Race

    @@all = []

    def self.all
        @@all
    end

    def self.create_from_api(array_of_hashes)
        array_of_hashes.each do |racehash|
            create(format_hash(racehash))
        end
    end

    def self.format_hash(hsh)
        hsh.each_with_object({}) do |(k,v), mem|
            mem[k.to_sym] = v
        end
    end
    private_class_method :format_hash

    def self.create(index: nil, name:, url:)
        race = new(name: name, url: url)
        race.save
        race
    end
    private_class_method :create
    
    attr_accessor :name, :url, :speed, :alignment, :age, :size_description, :language_desc
    
    def initialize(name:, url: nil, speed: nil, alignment: nil, age: nil, size_description: nil, language_desc: nil)
        @name = name
        @url = url
        @speed = speed
        @alignment = alignment
        @age = age
        @size_description = size_description
        @language_desc = language_desc
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