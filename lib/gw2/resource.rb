require "gw2/json"
require "gw2/https"

module GW2
  module Resource
    include HTTPS
    include JSON

    def get(endpoint, query = {})
      parse(request(endpoint, query: query).body)
    end
  end
end
