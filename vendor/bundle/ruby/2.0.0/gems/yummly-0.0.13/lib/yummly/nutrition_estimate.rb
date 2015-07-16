# The nutritional composition of the recipe, in the form of a list of nutrients and their amounts, per serving. Yummly
# will return nutrition estimates only for those recipes where we are reasonably confident in their accuracy. These are
# only estimates and you should be clear about that in what you tell your users.
module Yummly
  class NutritionEstimate

    # Nutrition attribute’s search parameter name.
    attr_accessor :attribute

    # Display name of this nutrition attribute.
    attr_accessor :description

    # Nutrition attribute value for this recipe.
    attr_accessor :value

    # Implied unit of measure as a Yummly::Unit object.
    attr_accessor :unit

    def initialize(values)
      @attribute = values["attribute"]
      @description = values["description"]
      @value = values["value"]
      @unit = Yummly::Unit.new(values["unit"])
    end

  end
end