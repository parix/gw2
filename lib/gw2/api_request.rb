require "gw2/https"
require "gw2/json"

module GW2
  class ApiRequest
    extend HTTPS
    extend JSON

    private

    def self.get(endpoint, query = {})
      endpoint_path = endpoint_path(endpoint)
      response = request(endpoint_path, query: query)
      parse(response.body)
    end

    def self.endpoint_path(endpoint)
      "/#{endpoint}.json"
    end
  end
end
