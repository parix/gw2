module GW2
  module Event
    def self.world_names
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/world_names.json"
      )

      return JSON.parse(response.body)
    end
  end
end
