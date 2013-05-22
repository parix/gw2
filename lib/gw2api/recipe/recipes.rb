module GW2API
  module Recipe
    def self.recipes
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/recipes.json"
      )

      return JSON.parse(response.body)
    end
  end
end
