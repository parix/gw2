require "gw2/json"
require "gw2/https"

module GW2
  module Resource
    include HTTPS
    include JSON

    BASE_URL_V1 = "https://api.guildwars2.com/v1"
    BASE_URL_V2 = "https://api.guildwars2.com/v2"

    def get(endpoint, query = {})
      parse(request(endpoint, query: query).body)
    end
  end
end
