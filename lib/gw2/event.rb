module GW2
  class Event < ApiRequest
    def self.all
      self.where
    end

    def self.where(query_hash = {})
      parse(request("/events.json", query: query_hash).body)
    end

    def self.event_names
      parse(request("/event_names.json").body)
    end

    def self.map_names
      parse(request("/map_names.json").body)
    end

    def self.world_names
      parse(request("/world_names.json").body)
    end
  end
end
