module GW2
  module Item
    def self.all
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/items.json"
      )

      return JSON.parse(response.body)
    end
  end
end
