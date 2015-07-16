# Configuration class that stores configuration options for the Yummly API.
#
# Yummly requires an App ID and APP key combination to authenticate against its API. At the very least these must be
# supplied in the configuration.
#
# Additionally for certain paid plans Yummly offers SSL API access, so setting the configuration option use_ssl to true
# will send all API calls over HTTPS. This options defaults to false.
#
# Configuration options are typically set via the Yummly.config method.
# @see Yummly.configure
# @example
#   Yummly.configure do |config|
#     config.app_id = "12345"
#     config.app_key = "XXXXXXXXXXXXXXXXXXXXXXXX"
#   end
module Yummly
  class Configuration

    attr_accessor :app_key,
                  :app_id,
                  :use_ssl,
                  :http_adapter

    # Creates a configuration object, defaulting use_ssl to false.
    def initialize
      @use_ssl = false
      @http_adapter = Yummly::FaradayAdapter
    end

    # Returns true if API calls to Yummly should use SSL.
    #
    # @return [Boolean] true if API calls to Yummly should use SSL
    # @example
    #   Yummly.configuration.use_ssl?
    def use_ssl?
      use_ssl
    end

  end
end