module GW2
  class Recipe < ApiRequest
    def self.all
      get :recipes
    end

    def self.details(recipe_id)
      get :recipe_details, recipe_id: recipe_id
    end
  end
end
