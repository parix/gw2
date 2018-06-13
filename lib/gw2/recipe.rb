module GW2
  module Recipe
    extend Resource

    def self.all
      get("/recipes.json")
    end

    def self.details(recipe_id)
      get("/recipes/#{recipe_id}.json")
    end

    def self.search_input(item_id)
      get("/recipes/search.json", { input: item_id})
    end

    def self.search_output(item_id)
      get("/recipes/search.json", { output: item_id})
    end
  end
end
