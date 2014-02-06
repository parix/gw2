module GW2
  module Map
    PARAMS_FILTER = [:map_id]

    def self.all
      self.where
    end

    def self.where(query_hash = {})
      parse(request("/maps.json", query: query_hash).body)
    end
  end
end
