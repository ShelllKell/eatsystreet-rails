# The image that should be displayed along with the recipe if images are available. Comes in 3 different sizes.
module Yummly
  class Image

    # small (90×60)
    attr_accessor :small_url

    # medium (180×120)
    attr_accessor :medium_url

    # large (360×240)
    attr_accessor :large_url

    def initialize(values)
      @large_url = values["hostedLargeUrl"]
      @medium_url = values["hostedMediumUrl"]
      @small_url = values["hostedSmallUrl"]
    end

  end
end