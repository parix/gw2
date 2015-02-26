module GW2
  module Event
    extend HTTPS
    extend JSON

    def self.all
      raise GW2::Disabled, "This endpoint is disabled due to the implementation of Megaserver technology."
    end

    def self.where(query_hash = {})
      raise GW2::Disabled, "This endpoint is disabled due to the implementation of Megaserver technology."
    end

    def self.world_names
      parse(request("/world_names.json").body)
    end

    def self.event_names
      parse(request("/event_names.json").body)
    end

    def self.map_names
      parse(request("/map_names.json").body)
    end
  end
end
