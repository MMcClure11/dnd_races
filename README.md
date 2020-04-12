# DND Races for Character Creation

A Ruby Gem providing a CLI for users to view detailed information about different races for creating DND characters based on the DND's 5th Edition API. Includes information such as a race's: speed, alignment, size, lifespan, and languages.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

## Installation

git clone https://github.com/MMcClure11/dnd_races
cd dnd_races/

## Usage

Use the command below and follow interactive prompts

    bin/dnd_races

## Running Tests

To run automated tests for api type the below:

    rspec ./spec/api_spec.rb

To run automated tests for cli type the below:

    rspec ./spec/cli_spec.rb

To run automated test for the race type the below:

    rspec ./spec/race_spec.rb

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MMcClure11/dnd_races. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/<github username>/dnd_races/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DndRaces project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>/dnd_races/blob/master/CODE_OF_CONDUCT.md).
