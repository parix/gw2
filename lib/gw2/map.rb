module GW2
  class Map < ApiRequest
    def self.all
      where
    end

    def self.where(query_hash = {})
      get :maps, query_hash
    end

    def self.map_floor(continent_id, floor)
      get :map_floor, continent_id: continent_id, floor: floor
    end

    def self.continents
      get :continents
    end
  end
end
