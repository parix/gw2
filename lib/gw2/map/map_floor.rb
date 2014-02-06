module GW2
  module Map
    def self.map_floor(continent_id, floor)
      parse(request("/map_floor.json", query: { continent_id: continent_id, floor: floor }).body)
    end
  end
end
