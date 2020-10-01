# National Parks Services Sites 

This Ruby Gem provides a CLI allows the user to search for a National Park Service site by state and select the site to see more information about the specific site.

## Installation
You will need to retrieve a key from the National Parks Services site in order to run the CLI, you can do that here:

[NPS KEY](https://www.nps.gov/subjects/developer/get-started.htm)

You will then need to install the key in your terminal:

API_KEY=API_KEY=copy and paste your key here

The following gems are needed to successfully run this CLI and are required in the config/environment folder: HTTParty, Json, Pry, Dotenv and Colorator.

To install:

    $ gem install httparty

    $ gem install json
    
    $ gem install pry
    
    $ gem install dotenv
    
    $ gem install colorator

## Usage
To execute this CLI, type ruby bin/parks into the terminal. 

Follow along with the prompts to see a list of National Park Services sites by state and learn more information about specific National Park Services sites.

## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
