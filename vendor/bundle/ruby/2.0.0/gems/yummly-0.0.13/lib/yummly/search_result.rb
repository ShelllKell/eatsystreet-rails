# This enumerable class maps a Yummly search response to a set of recipe objects and includes meta data related to
# the overall search result, such as total match count.
#
# TODO: Make this class scrollable, allowing it to page through the results easily via next and previous, e.g.
module Yummly
  class SearchResult

    include Enumerable

    attr_accessor :json, :params, :max_result, :start

    def initialize(json)
      @json = json
    end

    def each(&block)
      recipes.each(&block)
    end

    def recipes
      @recipes ||= matches.collect { |recipe_json| Yummly::Recipe.new(recipe_json) }
    end

    def matches
      json["matches"] || []
    end

    def total_match_count
      json["totalMatchCount"]
    end
    alias_method :total, :total_match_count

    def attribution
      Yummly::Attribution.new(json["attribution"])
    end

    def criteria
      json["criteria"]
    end

  end
end