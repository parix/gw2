module GW2
  class Recipe < ApiRequest
    def self.all
      parse(request("/recipes.json").body)
    end

    def self.details(recipe_id)
      parse(request("/recipe_details.json", query: { recipe_id: recipe_id }).body)
    end
  end
end
