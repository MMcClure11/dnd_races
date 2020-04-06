class Races

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
        r = new(index: index, name: name, url: url)
        r.save
        r
    end

    attr_accessor :index, :name, :url
    
    def initialize(index:, name:, url:) #.send in initialize, great for inconsistent data
        @index = index
        @name = name
        @url = url
    end

    def save
        @@all << self
    end

end