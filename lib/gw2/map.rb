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
      get("/floors/#{continent_id}/#{floor}.json")
    end

    def self.continents
      get("/continents.json", { ids: "all"})
    end
  end
end
