module GW2
  module Event
    extend Resource

    def self.all
      raise GW2::Disabled, "This endpoint is disabled due to the implementation of Megaserver technology."
    end

    def self.where(query_hash = {})
      raise GW2::Disabled, "This endpoint is disabled due to the implementation of Megaserver technology."
    end

    def self.world_names
      get("/world_names.json")
    end

    def self.event_names
      raise GW2::Disabled, "This endpoint is disabled."
    end

    def self.map_names
      GW2::Misc.worlds
    end
  end
end
