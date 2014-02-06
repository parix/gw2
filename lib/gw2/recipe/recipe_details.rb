module GW2
  module Recipe
    def self.details(recipe_id)
      parse(request("/recipe_details.json", query: { recipe_id: recipe_id }).body)
    end
  end
end
