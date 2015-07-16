# This class handles the HTTP interactions with the Yummly API calls.
module Yummly
  class FaradayAdapter

    def self.connection(url = nil)
      Faraday.new(:url => url) do |faraday|
        faraday.request :url_encoded # form-encode POST params
        faraday.response :logger # log requests to STDOUT
        faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
      end
    end

  end
end