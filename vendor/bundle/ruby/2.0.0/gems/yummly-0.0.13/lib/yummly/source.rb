# Contains details about the origin of the recipe.
module Yummly
  class Source

    # The original source url of this recipe.
    attr_accessor :recipe_url

    # The url of the source site of this recipe.
    attr_accessor :site_url

    # The display name of the source site.
    attr_accessor :display_name

    def initialize(values)
      @recipe_url = values["sourceRecipeUrl"]
      @site_url = values["sourceSiteUrl"]
      @display_name= values["sourceDisplayName"]
    end

  end
end