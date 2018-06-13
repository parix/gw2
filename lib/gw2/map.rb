module GW2
  module Map
    extend Resource

    def self.all
      get("/maps.json")
    end

    def self.details(map_id)
      get("/maps/#{map_id}.json")
    end

    def self.floor(continent_id, floor)
      get("/map_floor.json", query: { continent_id: continent_id, floor: floor })
    end

    def self.continents(continent_id="all")
      get("/continents.json", query: { ids: continent_id })
    end
  end
end
