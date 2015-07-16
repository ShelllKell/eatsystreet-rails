# This class handles the HTTP interactions with the Yummly API calls.
module Yummly
  class UrlBuilder

    class << self

      def domain
        "#{self.protocol}://api.yummly.com"
      end

      def uri(command, params = {})
        query_string = self.build_params_query_string(params)
        "/#{self.api_version}/api/#{command}?#{query_string}"
      end

      def build_params_query_string(params = {})
        params['_app_id'] = Yummly.configuration.app_id
        params['_app_key'] = Yummly.configuration.app_key
        Rack::Utils.build_query(params)
      end

      def protocol
        Yummly.configuration.use_ssl? ? 'https' : 'http'
      end

      def api_version
        Yummly::API_VERSION
      end

    end

  end
end