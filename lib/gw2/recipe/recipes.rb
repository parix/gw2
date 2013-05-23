module GW2
  module Recipe
    def self.all
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/recipes.json"
      )

      return JSON.parse(response.body)
    end
  end
end
