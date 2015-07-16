# Contains the attribution values.
module Yummly
  class Attribution

    attr_reader :html,
                :url,
                :text,
                :logo

    def initialize(values)
      @html = values["html"]
      @url = values["url"]
      @text = values["text"]
      @logo = values["logo"]
    end

  end
end