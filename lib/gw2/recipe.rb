module GW2
  module Recipe
    extend HTTPS
    extend JSON

    def self.all
      parse(request("/recipes.json").body)["recipes"]
    end

    def self.details(recipe_id)
      parse(request("/recipe_details.json", query: { recipe_id: recipe_id }).body)
    end
  end
end
