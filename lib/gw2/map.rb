module GW2
  module Map
    extend Resource

    PARAMS_FILTER = [:map_id]

    def self.all
      self.where
    end

    def self.where(query = {})
      get("/maps.json", query)["maps"]
    end

    def self.map_floor(continent_id, floor)
      get("/map_floor.json", { continent_id: continent_id, floor: floor })
    end

    def self.continents
      get("/continents.json")["continents"]
    end
  end
end
