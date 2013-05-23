module GW2
  module Event
    def self.map_names
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/map_names.json"
      )

      return JSON.parse(response.body)
    end
  end
end
