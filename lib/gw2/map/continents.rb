module GW2
  module Map
    def self.continents
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/continents.json"
      )

      return JSON.parse(response.body)
    end
  end
end
