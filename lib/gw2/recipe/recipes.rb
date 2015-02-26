module GW2
  module Recipe
    def self.all
      parse(request("/recipes.json").body)["recipes"]
    end
  end
end
