[![Code Climate](https://codeclimate.com/repos/51b73d4a13d6371539009033/badges/9791fe90f214cf14a27b/gpa.png)](https://codeclimate.com/repos/51b73d4a13d6371539009033/feed)
[![Build Status](https://travis-ci.org/twmills/yummly.png?branch=master)](https://travis-ci.org/twmills/yummly)

# Yummly

This is the unofficial ruby wrapper to the Yummly API, "the world's largest and most powerful recipe search site".

https://developer.yummly.com/

## Installation

Add this line to your application's Gemfile:

    gem 'yummly'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yummly

## Configuration

First, configure Yummly with your APP key and ID, for example in an initializer if you're using Rails:

    # config/initializers/yummly.rb
    Yummly.configure do |config|
      config.app_id = "21334"
      config.app_key = "XXXXXXXXXXXXXXXXX"
      config.use_ssl = true # Default is false
    end

_Note: HTTPS API access is only available on some paid Yummly plans._

## API calls

Once configured, you have access to two API calls:

#### Search

The search command returns a Yummly::SearchResult object, which is a custom Enumerable collection of Recipe objects:

    result = Yummly.search('Onion soup')
    result.total # returns 43350
    result.size # returns 10
    result.collect { |recipe| recipe.name }

#### Find

The find command returns a single Yummly::Recipe object:

    recipe = Yummly.find('French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364')
    recipe.name # returns "French Onion Soup"

## The Recipe object

The Yummly ruby wrapper returns all results as recipe objects. These objects normalize the API responses to make it
easier for developers to interact with recipes from ruby. All Yummly recipe attributes have been directly mapped.
In cases where the JSON response returned an array for a specific attribute, an array of appropriate objects are returned
from the ruby Recipe object.

For example, to access the thumbnail image for a recipe:

    recipe = Yummly.find('French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364')
    recipe.images.first.small_url

(Shhhh, there's also a Recipe#thumbnail convenience method!)

Explore the Yummly::Recipe class to see the full range of available attributes.

## Errors

The yummly gem handles the API's exceptions by raising the following errors:

* **Yummly::PermissionError** - When your credentials are incorrect or you've exceeded the rate limit.
* **Yummly::InternalServerError** - When something's gone wrong on Yummly's servers
* **Yummly::Error** - Any other unexpected error that is returned.

_**Note:** There had been some discussion about raising an exception when a 404 is encountered, i.e. when a recipe doesn't
exist for a given ID. Currently the find call returns nil if a recipe cannot be found, but I may raise a new error in
the future if this is considered a truly exceptional case._

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
