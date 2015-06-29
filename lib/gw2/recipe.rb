module GW2
  module Recipe
    extend Resource

    def self.ids
      get("/recipes")
    end

    def self.find(recipe_id)
      get("/recipes/#{recipe_id}")
    end
  end
end
