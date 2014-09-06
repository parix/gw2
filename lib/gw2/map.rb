module GW2
  class Map < ApiRequest
    def self.all
      self.where
    end

    def self.where(query_hash = {})
      parse(request("/maps.json", query: query_hash).body)
    end

    def self.map_floor(continent_id, floor)
      parse(request("/map_floor.json", query: { continent_id: continent_id, floor: floor }).body)
    end

    def self.continents
      parse(request("/continents.json").body)
    end
  end
end
