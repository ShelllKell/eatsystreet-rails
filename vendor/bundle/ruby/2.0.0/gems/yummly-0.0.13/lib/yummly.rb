require "faraday"
require "rack"
require "json"
require "yummly/api"
require "yummly/attribution"
require "yummly/configuration"
require "yummly/connection"
require "yummly/faraday_adapter"
require "yummly/flavor"
require "yummly/image"
require "yummly/nutrition_estimate"
require "yummly/recipe"
require "yummly/search_result"
require "yummly/source"
require "yummly/unit"
require "yummly/version"
require "yummly/url_builder"

module Yummly

  API_VERSION = 'v1'

  class << self

    attr_accessor :configuration

    def configure
      configuration = Yummly::Configuration.new
      yield(configuration)
      self.configuration = configuration
    end

    def search(terms, params = {})
      Yummly::Api.search(terms, params)
    end

    def find(recipe_id)
      Yummly::Api.find(recipe_id)
    end
  end

  class Error < StandardError; end
  class PermissionError < Error; end
  class InternalServerError < Error; end
end
