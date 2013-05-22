module GW2API
  module Item
    def self.items
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/items.json"
      )

      return JSON.parse(response.body)
    end
  end
end
