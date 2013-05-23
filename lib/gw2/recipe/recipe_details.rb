module GW2
  module Recipe 
    def self.details(recipe_id)
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/recipe_details.json?recipe_id=#{recipe_id}"
      )

      return JSON.parse(response.body)
    end
  end
end
