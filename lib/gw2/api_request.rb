require "gw2/https"
require "gw2/json"

module GW2
  class ApiRequest
    extend HTTPS
    extend JSON

    private

    def self.get(endpoint, query = {})
      path = endpoint_path(endpoint)
      response = request(path, query: query)
      parse(response)
    end

    def self.endpoint_path(endpoint)
      endpoint = Array(endpoint).join('/')
      "/#{endpoint}.json"
    end
  end
end
