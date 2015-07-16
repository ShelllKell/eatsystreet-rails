# Contains the flavor scores for a recipe, each on a range from 0 to 1.
module Yummly
  class Flavor

    attr_accessor :spiciness,
                  :bitterness,
                  :sweetness,
                  :savoriness,
                  :saltiness,
                  :sourness

    def initialize(values)
      @spiciness = values["Piquant"]
      @bitterness = values["Bitter"]
      @sweetness = values["Sweet"]
      @savoriness = values["Meaty"]
      @sourness = values["Sour"]
      @saltiness = values["Salty"]
    end

  end
end