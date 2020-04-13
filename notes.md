1. flow
2. classes
    2.a class relationships

user is asked for a race
user selects a race based on a number
user sees a list of traits for that race


classes: (blueprint, factory)
    - API(goes out and gets the data)
    - Race(know about races, store them there)
    - CLI(responsible for interacting with the user)-Command Line Interface


    ReadMe info for if decide to turn it into a Gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dnd_races'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dnd_races


##using class << self

class << self
  def all
      @@all
  end

  def create_from_api(array_of_hashes)
      array_of_hashes.each do |racehash|
          create(format_hash(racehash))
      end
  end

  private 
  def format_hash(hsh)
      hsh.each_with_object({}) do |(k,v), mem|
          mem[k.to_sym] = v
      end
  end

  def create(index: nil, name:, url:)
      new(name: name, url: url)
  end
end