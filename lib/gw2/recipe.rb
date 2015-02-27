module GW2
  module Recipe
    extend Resource

    def self.all
      get("/recipes.json")["recipes"]
    end

    def self.details(recipe_id)
      get("/recipe_details.json", { recipe_id: recipe_id })
    end
  end
end
